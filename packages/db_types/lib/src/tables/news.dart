import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
abstract class News with _$News {
  const factory News({
    required int id,
    required String title,
    required String url,
    DateTime? publishedAt,
    DateTime? unpublishedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}