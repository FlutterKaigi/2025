import 'dart:io';

import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/session/data/provider/bookmarked_sessions_provider.dart';
import 'package:app/features/session/data/provider/session_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

part 'notification_service_provider.g.dart';

@Riverpod(keepAlive: true)
FlutterLocalNotificationsPlugin notificationPlugin(Ref ref) {
  final plugin = FlutterLocalNotificationsPlugin();
  return plugin;
}

@Riverpod(keepAlive: true)
class NotificationService extends _$NotificationService {
  @override
  Future<void> build() async {
    await _initialize();
  }

  Future<void> _initialize() async {
    // Web やデスクトッププラットフォームでは通知機能を使用しない
    if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
      return;
    }

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Tokyo'));

    final plugin = ref.read(notificationPluginProvider);

    const initializationSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const initializationSettingsIOS = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // 通知タップ時の処理
    await plugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _handleNotificationTap,
    );

    // iOS/Androidの通知権限をリクエスト
    if (plugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >() !=
        null) {
      await plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()!
          .requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }

    if (plugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >() !=
        null) {
      await plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()!
          .requestNotificationsPermission();
    }
  }

  /// 通知タップ時の処理
  void _handleNotificationTap(NotificationResponse response) {
    final sessionId = response.payload;
    if (sessionId != null && sessionId.isNotEmpty) {
      // セッション詳細画面に遷移
      final router = ref.read(routerProvider);
      router.go(SessionDetailRoute(sessionId: sessionId).location);
    }
  }

  /// UUIDから一意な通知IDを生成
  /// UUIDの最初の8文字を16進数としてintに変換し、符号付き32ビット整数の範囲に収める
  int _generateNotificationId(String sessionId) {
    final hexString = sessionId.replaceAll('-', '').substring(0, 8);
    final value = int.parse(hexString, radix: 16);
    return value & 0x7FFFFFFF;
  }

  /// セッション開始15分前の通知をスケジュール
  Future<void> scheduleSessionNotification({
    required String sessionId,
    required String sessionTitle,
    required String venue,
    required DateTime sessionStartsAt,
  }) async {
    if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
      return;
    }

    final plugin = ref.read(notificationPluginProvider);

    // セッション開始15分前に通知
    final notificationTime = sessionStartsAt.toLocal().subtract(
      const Duration(minutes: 15),
    );

    // 通知時刻が過去の場合はスケジュールしない
    if (notificationTime.isBefore(DateTime.now())) {
      return;
    }

    final notificationId = _generateNotificationId(sessionId);

    final t = LocaleSettings.currentLocale.translations.session.notification;

    final androidDetails = AndroidNotificationDetails(
      'session_reminder',
      t.channel_name,
      channelDescription: t.channel_description,
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await plugin.zonedSchedule(
      notificationId,
      t.title,
      t.body(title: sessionTitle, venue: venue),
      tz.TZDateTime.from(notificationTime, tz.local),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: sessionId,
    );
  }

  /// セッションの通知をキャンセル
  Future<void> cancelSessionNotification(String sessionId) async {
    if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
      return;
    }

    final plugin = ref.read(notificationPluginProvider);
    final notificationId = _generateNotificationId(sessionId);
    await plugin.cancel(notificationId);
  }

  /// 全ての通知をキャンセル
  Future<void> cancelAllNotifications() async {
    if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
      return;
    }

    final plugin = ref.read(notificationPluginProvider);
    await plugin.cancelAll();
  }

  /// 既存のお気に入りセッションで通知がスケジュールされていないものをスケジュール
  Future<void> rescheduleAllBookmarkedSessions() async {
    if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
      return;
    }

    try {
      final plugin = ref.read(notificationPluginProvider);

      // 既にスケジュールされている通知IDを取得
      final pendingNotifications = await plugin.pendingNotificationRequests();
      final scheduledNotificationIds = pendingNotifications
          .map((n) => n.id)
          .toSet();

      // お気に入りセッションIDを取得
      final bookmarkedSessionIds = await ref.read(
        bookmarkedSessionsProvider.future,
      );

      // 全セッション情報を取得
      final sessions = await ref.read(sessionsProvider.future);

      // お気に入りの各セッションの通知をスケジュール
      for (final sessionId in bookmarkedSessionIds) {
        // セッションIDに一致するセッションを検索
        final matchingSessions = sessions
            .where((s) => s.id == sessionId)
            .toList();

        // セッションが見つからない場合はスキップ
        if (matchingSessions.isEmpty) {
          continue;
        }

        final session = matchingSessions.first;
        final notificationId = _generateNotificationId(session.id);

        // 既にスケジュールされている場合はスキップ
        if (scheduledNotificationIds.contains(notificationId)) {
          continue;
        }

        await scheduleSessionNotification(
          sessionId: session.id,
          sessionTitle: session.title,
          venue: session.venue,
          sessionStartsAt: session.startsAt,
        );
      }
    } on Exception catch (_) {
      // break
    }
  }
}
