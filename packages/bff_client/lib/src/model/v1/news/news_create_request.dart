import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_create_request.freezed.dart';
part 'news_create_request.g.dart';

@freezed
abstract class NewsCreateRequest with _$NewsCreateRequest {
  const factory NewsCreateRequest({
    required String title,
    required String url,
    DateTime? startsAt,
    DateTime? endsAt,
  }) = _NewsCreateRequest;

  factory NewsCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$NewsCreateRequestFromJson(json);
}