import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
abstract class News with _$News {
  const factory News({
    required int id,
    required String title,
    String? url,
    @RequiredDateTimeConverter() required DateTime startsAt,
    @DateTimeConverter() DateTime? endsAt,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
