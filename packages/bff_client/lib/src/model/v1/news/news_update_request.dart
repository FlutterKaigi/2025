import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_update_request.freezed.dart';
part 'news_update_request.g.dart';

@freezed
abstract class NewsUpdateRequest with _$NewsUpdateRequest {
  const factory NewsUpdateRequest({
    required String title,
    required String url,
    required DateTime startsAt,
    DateTime? endsAt,
  }) = _NewsUpdateRequest;

  factory NewsUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$NewsUpdateRequestFromJson(json);
}
