import 'package:db_types/db_types.dart';
import 'package:postgres/postgres.dart';

class NewsDbClient {
  NewsDbClient({required Connection connection}) : _connection = connection;

  final Connection _connection;

  /// 公開中のニュース一覧を取得する
  Future<List<News>> getPublishedNewsList() async {
    final result = await _connection.execute(
      Sql.named('''
SELECT *
FROM public.news
WHERE
  (starts_at IS NULL OR starts_at <= NOW()) AND
  (ends_at IS NULL OR ends_at > NOW())
ORDER BY id DESC
'''),
    );
    return result.map((e) => News.fromJson(e.toColumnMap())).toList();
  }

  /// 管理者向け：全てのニュース一覧を取得する（未公開含む）
  Future<List<News>> getAllNewsList() async {
    final result = await _connection.execute(
      Sql.named('''
SELECT *
FROM public.news
ORDER BY id DESC
'''),
    );
    return result.map((e) => News.fromJson(e.toColumnMap())).toList();
  }

  /// IDでニュースを取得する
  Future<News?> getNewsById(int id) async {
    final result = await _connection.execute(
      Sql.named('''
SELECT *
FROM public.news
WHERE id = @id
LIMIT 1
'''),
      parameters: {
        'id': id,
      },
    );

    final news = result.firstOrNull?.toColumnMap();
    if (news == null) {
      return null;
    }

    return News.fromJson(news);
  }

  /// ニュースを作成する
  Future<News> createNews({
    required String title,
    required String url,
    DateTime? startsAt,
    DateTime? endsAt,
  }) async {
    final result = await _connection.execute(
      Sql.named('''
INSERT INTO public.news (title, url, starts_at, ends_at)
VALUES (@title, @url, @starts_at, @ends_at)
RETURNING *
'''),
      parameters: {
        'title': title,
        'url': url,
        'starts_at': startsAt,
        'ends_at': endsAt,
      },
    );

    return News.fromJson(result.first.toColumnMap());
  }

  /// ニュースを更新する
  Future<News?> updateNews({
    required int id,
    required String title,
    required String url,
    DateTime? startsAt,
    DateTime? endsAt,
  }) async {
    final result = await _connection.execute(
      Sql.named('''
UPDATE public.news
SET
  title = @title,
  url = @url,
  starts_at = @starts_at,
  ends_at = @ends_at
WHERE id = @id
RETURNING *
'''),
      parameters: {
        'id': id,
        'title': title,
        'url': url,
        'starts_at': startsAt,
        'ends_at': endsAt,
      },
    );

    final news = result.firstOrNull?.toColumnMap();
    if (news == null) {
      return null;
    }

    return News.fromJson(news);
  }

  /// ニュースを削除する
  Future<bool> deleteNews(int id) async {
    final result = await _connection.execute(
      Sql.named('''
DELETE FROM public.news
WHERE id = @id
'''),
      parameters: {
        'id': id,
      },
    );

    return result.affectedRows > 0;
  }
}
