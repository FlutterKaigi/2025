import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:app/features/ticket/data/repository/ticket_repository.dart';
import 'package:app/features/websocket/data/provider/websocket_provider.dart';
import 'package:bff_client/bff_client.dart';
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
      websocketStreamProvider,
      (_, next) async {
        if (next is AsyncError) {
          ref.invalidateSelf();
        }
        final payload = next.value;
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
}
