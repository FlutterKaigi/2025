import 'package:db_client/src/client/db_client.dart';
import 'package:db_client/src/extensions/postgres_extensions.dart';
import 'package:db_types/db_types.dart';

class SpeakerDbClient {
  const SpeakerDbClient({
    required Executor executor,
    required String storageBaseUrl,
  }) : _executor = executor,
       _storageBaseUrl = storageBaseUrl;

  final Executor _executor;
  final String _storageBaseUrl;

  /// スピーカー一覧を取得
  Future<List<Speakers>> getAllSpeakers() async {
    final result = await _executor.execute(
      '''
        SELECT
          id,
          name,
          avatar_name,
          x_id
        FROM speakers
        ORDER BY name
      ''',
    );

    return result.map((e) {
      return Speakers.fromJson(e.toColumnMapSafe());
    }).toList();
  }

  /// 特定スピーカーの詳細を取得
  Future<Speakers?> getSpeakerById(String speakerId) async {
    final result = await _executor.execute(
      '''
        SELECT
          id,
          name,
          avatar_name,
          x_id
        FROM speakers
        WHERE id = @speakerId
      ''',
      parameters: {'speakerId': speakerId},
    );

    if (result.isEmpty) {
      return null;
    }

    return Speakers.fromJson(result.first.toColumnMapSafe());
  }

  /// セッションに紐づくスピーカー一覧を取得
  Future<List<Speakers>> getSpeakersBySessionId(String sessionId) async {
    final result = await _executor.execute(
      '''
        SELECT
          s.id,
          s.name,
          s.avatar_name,
          s.x_id
        FROM speakers s
        INNER JOIN session_speakers ss ON s.id = ss.speaker_id
        WHERE ss.session_id = @sessionId
        ORDER BY s.name
      ''',
      parameters: {'sessionId': sessionId},
    );

    return result.map((e) {
      return Speakers.fromJson(e.toColumnMapSafe());
    }).toList();
  }

  /// スピーカーのアバターURLを生成
  String? generateAvatarUrl(String? avatarName) {
    if (avatarName == null) {
      return null;
    }
    return '$_storageBaseUrl/storage/v1/object/public/speakers/$avatarName';
  }
}
