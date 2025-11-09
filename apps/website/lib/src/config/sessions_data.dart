import 'dart:convert';

import 'package:bff_client/bff_client.dart';
import 'package:flutterkaigi_2025_website/src/config/sessions_data.json.dart'
    show sessionsDataJson;

// このファイルはビルド時に生成されたJSONファイルを読み込んでパースします
// JSONファイルの内容は sessions_data.json.dart として別途生成されます

// JSONデータをパースしてキャッシュ
final _jsonData = jsonDecode(sessionsDataJson) as Map<String, dynamic>;

/// タイムラインイベントのリスト
final List<TimelineEvent> timelineEvents =
    (_jsonData['timelineEvents'] as List<dynamic>)
        .map((e) => TimelineEvent.fromJson(e as Map<String, dynamic>))
        .toList();

/// セッションスケジュールのマップ
final Map<String, List<ScheduleSession>> sessionSchedule =
    (_jsonData['sessionSchedule'] as Map<String, dynamic>).map(
      (key, value) => MapEntry(
        key,
        (value as List<dynamic>)
            .map((s) => ScheduleSession.fromJson(s as Map<String, dynamic>))
            .toList(),
      ),
    );

/// 会場別セッションのリスト
final List<VenueWithSessions> venuesWithSessions =
    (_jsonData['venuesWithSessions'] as List<dynamic>)
        .map((v) => VenueWithSessions.fromJson(v as Map<String, dynamic>))
        .toList();
