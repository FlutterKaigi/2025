import 'package:db_client/src/client/db_client.dart';
import 'package:db_client/src/extensions/postgres_extensions.dart';
import 'package:db_types/db_types.dart';

final class JobBoardDbClient {
  const JobBoardDbClient({
    required Executor executor,
    required String logoBaseUrl,
  }) : _executor = executor,
       _logoBaseUrl = logoBaseUrl;

  final Executor _executor;
  final String _logoBaseUrl;

  /// Job Board 一覧を取得
  Future<List<JobBoard>> getJobBoards() async {
    final result = await _executor.execute(
      '''
        SELECT
          id,
          url,
          alt_text,
          image_name
        FROM job_boards
        ORDER BY id
      ''',
    );

    return result.map((e) {
      final json = e.toColumnMapSafe();
      // 画像ファイル名を画像 URL に変換
      final imageName = json['image_name'] as String;
      json['image_url'] = '$_logoBaseUrl/job-boards/$imageName';
      json.remove('image_name');
      return JobBoard.fromJson(json);
    }).toList();
  }
}
