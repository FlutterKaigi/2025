import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_signed_url_request.freezed.dart';
part 'put_signed_url_request.g.dart';

@freezed
abstract class PutSignedUrlRequest with _$PutSignedUrlRequest {
  const factory PutSignedUrlRequest({
    required String key,
    required int size,
    required String mimeType,
    required String variant,
    int? expiresIn,
  }) = _PutSignedUrlRequest;

  factory PutSignedUrlRequest.fromJson(Map<String, dynamic> json) =>
      _$PutSignedUrlRequestFromJson(json);
}