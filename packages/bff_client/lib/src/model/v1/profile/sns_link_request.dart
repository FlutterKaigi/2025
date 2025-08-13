import 'package:freezed_annotation/freezed_annotation.dart';

part 'sns_link_request.freezed.dart';
part 'sns_link_request.g.dart';

@freezed
abstract class SnsLinkRequest with _$SnsLinkRequest {
  const factory SnsLinkRequest({
    required String snsType,
    required String value,
  }) = _SnsLinkRequest;

  factory SnsLinkRequest.fromJson(Map<String, dynamic> json) =>
      _$SnsLinkRequestFromJson(json);
}
