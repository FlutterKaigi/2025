import 'package:dashboard/features/news/data/news.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_provider.g.dart';

@riverpod
Future<List<News>> news(Ref ref) async {
  await Future<void>.delayed(const Duration(seconds: 1));
  return [
    News(
      id: 0,
      text: 'FlutterKaigi mini #4 @Kyoto を開催',
      url: Uri.parse(
        'https://medium.com/flutterkaigi/flutterkaigi-mini-4-kyoto-%E3%82%92%E9%96%8B%E5%82%AC%E3%81%97%E3%81%BE%E3%81%99-85facf0ec6b2',
      ),
      startedAt: DateTime(2025, 4, 16),
      endedAt: DateTime(2025, 6, 30),
    ),
    News(
      id: 1,
      text: 'FlutterKaigi 2025 スポンサー募集を開始',
      url: Uri.parse(
        'https://medium.com/flutterkaigi/flutterkaigi-2025-%E3%82%B9%E3%83%9D%E3%83%B3%E3%82%B5%E3%83%BC%E5%8B%9F%E9%9B%86%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6-034330881a94',
      ),
      startedAt: DateTime(2025, 4, 23),
    ),
  ];
}
