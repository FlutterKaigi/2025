import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_signed_url_response.freezed.dart';
part 'create_signed_url_response.g.dart';

@freezed
abstract class CreateSignedUrlResponse with _$CreateSignedUrlResponse {
  const factory CreateSignedUrlResponse({
    required String key,
    required String signedUrl,
  }) = _CreateSignedUrlResponse;

  factory CreateSignedUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSignedUrlResponseFromJson(json);
}
