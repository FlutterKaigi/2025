import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_signed_url_response.freezed.dart';
part 'put_signed_url_response.g.dart';

@freezed
abstract class PutSignedUrlResponse with _$PutSignedUrlResponse {
  const factory PutSignedUrlResponse({
    required String key,
    @JsonKey(name: 'signed_url') required String signedUrl,
  }) = _PutSignedUrlResponse;

  factory PutSignedUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$PutSignedUrlResponseFromJson(json);
}