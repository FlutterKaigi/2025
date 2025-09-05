import 'package:db_types/db_types.dart' as db_types;
import 'package:freezed_annotation/freezed_annotation.dart';

export 'news_create_request.dart';
export 'news_list_response.dart';
export 'news_update_request.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
abstract class News with _$News {
  const factory News({
    required int id,
    required String title,
    required DateTime startsAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? url,
    DateTime? endsAt,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}

extension NewsExtension on db_types.News {
  News toNews() => News(
    id: id,
    title: title,
    startsAt: startsAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
    url: url,
    endsAt: endsAt,
  );
}
