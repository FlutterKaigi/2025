import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_upload_url_request.freezed.dart';
part 'avatar_upload_url_request.g.dart';

@freezed
abstract class AvatarUploadUrlRequest with _$AvatarUploadUrlRequest {
  const factory AvatarUploadUrlRequest({
    required String fileName,
    required String contentType,
  }) = _AvatarUploadUrlRequest;

  factory AvatarUploadUrlRequest.fromJson(Map<String, dynamic> json) =>
      _$AvatarUploadUrlRequestFromJson(json);
}