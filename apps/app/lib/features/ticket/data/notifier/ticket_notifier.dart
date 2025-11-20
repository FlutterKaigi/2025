import 'dart:io';

import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:app/features/session/data/provider/notification_service_provider.dart';
import 'package:app/features/ticket/data/repository/ticket_repository.dart';
import 'package:app/features/websocket/data/provider/websocket_provider.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_notifier.g.dart';

@riverpod
class TicketNotifier extends _$TicketNotifier {
  @override
  Future<List<TicketItem>> build() async {
    final isAnonymousOrNull = ref.watch(
      authProvider.select((v) => v.value?.isAnonymous),
    );

    if (isAnonymousOrNull == null || isAnonymousOrNull) {
      return [];
    }

    final repository = ref.watch(ticketRepositoryProvider);
    ref.keepAlive();
    ref.listen(
      websocketPayloadStreamProvider,
      (_, next) async {
        if (next is AsyncError) {
          // WebSocketエラーが発生した場合はログのみ記録し、invalidateはしない
          // 無限ループを防ぐため
          return;
        }
        final payload = next.value;
        if (payload == null) {
          return;
        }
        switch (payload) {
          case UserWebsocketTicketStatusPayload(:final ticketStatus):
            await _updateTicketStatus(ticketStatus);
          case UserWebsocketEntryLogPayload(:final entryLog):
            await _updateEntryLog(entryLog);
          case _:
            break;
        }
      },
    );
    return repository.getUserTickets();
  }

  Future<void> _updateTicketStatus(TicketStatusPayload ticketStatus) async {
    final current = await future;
    final updatedTickets = current.map((ticket) {
      if (ticket case TicketPurchaseItem(
        :final purchase,
      ) when purchase.id == ticketStatus.id) {
        return TicketPurchaseItem(
          ticketType: ticket.ticketType,
          purchase: purchase.copyWith(
            status: switch (ticketStatus.status) {
              TicketStatusType.completed => TicketPurchaseStatus.completed,
              TicketStatusType.refunded => TicketPurchaseStatus.refunded,
            },
            updatedAt: ticketStatus.updatedAt,
          ),
          options: ticket.options,
        );
      }
      return ticket;
    }).toList();
    state = AsyncData(updatedTickets);

    // 返金時の通知
    if (ticketStatus.status == TicketStatusType.refunded) {
      await _showRefundNotification();
    }
  }

  Future<void> _updateEntryLog(EntryLogWebsocketPayload entryLog) async {
    final current = await future;
    final updatedTickets = current.map((ticket) {
      if (ticket case TicketPurchaseItem(:final purchase)) {
        switch (entryLog) {
          case EntryLogAddWebsocketPayload(
                :final ticketPurchaseId,
                :final createdAt,
              )
              when purchase.id == ticketPurchaseId:
            return TicketPurchaseItem(
              ticketType: ticket.ticketType,
              purchase: purchase.copyWith(
                entryLog: EntryLog(
                  ticketPurchaseId: ticketPurchaseId,
                  createdAt: createdAt,
                ),
              ),
              options: ticket.options,
            );
          case EntryLogDeleteWebsocketPayload(:final ticketPurchaseId)
              when purchase.id == ticketPurchaseId:
            return TicketPurchaseItem(
              ticketType: ticket.ticketType,
              purchase: purchase.copyWith(entryLog: null),
              options: ticket.options,
            );
          case _:
            break;
        }
      }
      return ticket;
    }).toList();
    state = AsyncData(updatedTickets);

    // 入場時の通知
    if (entryLog is EntryLogAddWebsocketPayload) {
      await _showEntryNotification();
    }
  }

  Future<TicketCheckoutSessionResponse> createCheckout(
    TicketCheckoutRequest request,
  ) async {
    final repository = ref.read(ticketRepositoryProvider);
    final response = await repository.createCheckout(request);
    ref.invalidateSelf(asReload: true);

    return response;
  }

  Future<void> cancelCheckout(String checkoutId) async {
    final repository = ref.read(ticketRepositoryProvider);
    await repository.cancelCheckout(checkoutId);
    ref.invalidateSelf(asReload: true);
  }

  /// 入場通知を表示
  Future<void> _showEntryNotification() async {
    // Web やデスクトッププラットフォームでは通知機能を使用しない
    if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
      return;
    }

    final plugin = ref.read(notificationPluginProvider);
    final t = LocaleSettings.currentLocale.translations.ticket.notification;

    final androidDetails = AndroidNotificationDetails(
      'ticket_status',
      t.channel_name,
      channelDescription: t.channel_description,
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      interruptionLevel: InterruptionLevel.timeSensitive,
      presentBanner: true,
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await plugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      t.entry.title,
      t.entry.body,
      notificationDetails,
    );
  }

  /// 返金通知を表示
  Future<void> _showRefundNotification() async {
    // Web やデスクトッププラットフォームでは通知機能を使用しない
    if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
      return;
    }

    final plugin = ref.read(notificationPluginProvider);
    final t = LocaleSettings.currentLocale.translations.ticket.notification;

    final androidDetails = AndroidNotificationDetails(
      'ticket_status',
      t.channel_name,
      channelDescription: t.channel_description,
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      interruptionLevel: InterruptionLevel.timeSensitive,
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await plugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      t.refund.title,
      t.refund.body,
      notificationDetails,
    );
  }
}
