import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_signed_url_request.freezed.dart';
part 'create_signed_url_request.g.dart';

@freezed
abstract class CreateSignedUrlRequest with _$CreateSignedUrlRequest {
  const factory CreateSignedUrlRequest({
    required String key,
    required String extension,
    required int contentLength,
    required String mimeType,
    required int expiresIn,
  }) = _CreateSignedUrlRequest;

  factory CreateSignedUrlRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSignedUrlRequestFromJson(json);
}
