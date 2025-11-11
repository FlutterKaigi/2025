import 'dart:io';

import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/account/data/notifier/profile_notifier.dart';
import 'package:app/features/account/data/repository/profile_share_repository.dart';
import 'package:app/features/session/data/provider/notification_service_provider.dart';
import 'package:app/features/websocket/data/provider/websocket_provider.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_share_notifier.g.dart';

/// プロフィールシェアの状態管理Notifier
@riverpod
class ProfileShareNotifier extends _$ProfileShareNotifier {
  @override
  Future<List<ProfileWithSns>> build() async {
    final hasProfile = ref.watch(
      profileProvider.select((v) => v.value != null),
    );
    if (!hasProfile) {
      throw const ProfileNotFoundException();
    }
    final repository = ref.watch(profileShareRepositoryProvider);
    ref.keepAlive();
    ref.listen(
      websocketStreamProvider,
      (_, next) async {
        if (next is AsyncError) {
          ref.invalidateSelf();
        }
        final payload = next.value;
        if (payload is UserWebsocketProfileSharePayload) {
          final share = payload.profileShare;
          if (share is ProfileShareAddWebsocketPayload) {
            await _showProfileExchangeNotification(share.profileWithSns);
            ref.invalidateSelf();
          }
        }
      },
    );
    return repository.getMyProfileShareList();
  }

  /// プロフィールシェアを作成
  ///
  /// [profileId] シェアするプロフィールのユーザーID
  Future<void> putProfileShare(String profileId) async {
    final repository = ref.read(profileShareRepositoryProvider);
    await repository.putProfileShare(profileId);
    // シェア一覧を再取得（非同期処理後なので外部から invalidate する必要がある）
  }

  /// プロフィールシェアを削除
  ///
  /// [profileId] 削除するプロフィールのユーザーID
  Future<void> deleteProfileShare(String profileId) async {
    final repository = ref.read(profileShareRepositoryProvider);
    await repository.deleteProfileShare(profileId);
    // シェア一覧を再取得（非同期処理後なので外部から invalidate する必要がある）
  }

  /// プロフィール交換通知を表示
  Future<void> _showProfileExchangeNotification(
    ProfileWithSns profileWithSns,
  ) async {
    // Web やデスクトッププラットフォームでは通知機能を使用しない
    if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
      return;
    }

    final plugin = ref.read(notificationPluginProvider);
    final profileName = profileWithSns.profile.name;

    // プロフィールIDから一意な通知IDを生成
    final notificationId = _generateNotificationId(profileWithSns.profile.id);

    final t = LocaleSettings
        .currentLocale
        .translations
        .account
        .profileshare
        .notification;

    final androidDetails = AndroidNotificationDetails(
      'profile_exchange',
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
      notificationId,
      t.title,
      t.body(name: profileName),
      notificationDetails,
    );
  }

  /// UUIDから一意な通知IDを生成
  /// UUIDの最初の8文字を16進数としてintに変換し、符号付き32ビット整数の範囲に収める
  int _generateNotificationId(String profileId) {
    final hexString = profileId.replaceAll('-', '').substring(0, 8);
    final value = int.parse(hexString, radix: 16);
    return value & 0x7FFFFFFF;
  }
}
