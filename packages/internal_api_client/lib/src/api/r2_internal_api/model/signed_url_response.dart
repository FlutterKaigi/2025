import 'package:freezed_annotation/freezed_annotation.dart';

part 'signed_url_response.freezed.dart';
part 'signed_url_response.g.dart';

@freezed
abstract class SignedUrlResponse with _$SignedUrlResponse {
  const factory SignedUrlResponse({
    required String key,
    required String signedUrl,
  }) = _SignedUrlResponse;

  factory SignedUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$SignedUrlResponseFromJson(json);
}
