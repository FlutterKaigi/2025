import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';

@freezed
abstract class News with _$News {
  const factory News({
    required int id,
    required String text,
    required Uri url,
    required DateTime startedAt,
    required DateTime? endedAt,
  }) = _News;
}
