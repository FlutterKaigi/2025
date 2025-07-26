import 'package:bff_client/bff_client.dart';
import 'package:dashboard/core/provider/bff_client.dart';
import 'package:dashboard/features/news/data/news.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_provider.g.dart';

@riverpod
Future<List<News>> news(Ref ref) async {
  final dio = ref.watch(bffDioProvider);
  final newsApiClient = NewsApiClient(dio);
  final response = await newsApiClient.getPublishedNewsList();

  // db_types の News を独自の News モデルに変換
  return response.data.news
      .map(
        (news) => News(
          id: news.id,
          title: news.title,
          url: news.url != null
              ? Uri.parse(news.url!)
              : Uri.parse('https://flutterkaigi.jp'),
          startedAt: news.createdAt,
        ),
      )
      .toList();
}
