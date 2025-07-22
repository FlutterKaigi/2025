import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_list_response.freezed.dart';
part 'news_list_response.g.dart';

@freezed
abstract class NewsListResponse with _$NewsListResponse {
  const factory NewsListResponse({
    required List<News> news,
  }) = _NewsListResponse;

  factory NewsListResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsListResponseFromJson(json);
}
