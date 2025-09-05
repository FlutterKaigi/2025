import 'package:freezed_annotation/freezed_annotation.dart';

part 'signed_url_request.freezed.dart';
part 'signed_url_request.g.dart';

@Freezed(unionKey: 'type')
sealed class SignedUrlRequest with _$SignedUrlRequest {
  const factory SignedUrlRequest.put({
    required String key,
    required String extension,
    required int contentLength,
    required String mimeType,
    required int expiresIn,
  }) = SignedUrlRequestPut;

  const factory SignedUrlRequest.get({
    required String key,
    required int expiresIn,
  }) = SignedUrlRequestGet;

  factory SignedUrlRequest.fromJson(Map<String, dynamic> json) =>
      _$SignedUrlRequestFromJson(json);
}
