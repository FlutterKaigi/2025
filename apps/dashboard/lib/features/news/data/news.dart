import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';

@freezed
abstract class News with _$News {
  const factory News({
    required int id,
    required String title,
    required Uri url,
    required DateTime startedAt,
  }) = _News;
}
