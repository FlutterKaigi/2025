import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_upload_url_response.freezed.dart';
part 'avatar_upload_url_response.g.dart';

@freezed
abstract class AvatarUploadUrlResponse with _$AvatarUploadUrlResponse {
  const factory AvatarUploadUrlResponse({
    required String uploadUrl,
    required String avatarKey,
    required int expiresIn,
  }) = _AvatarUploadUrlResponse;

  factory AvatarUploadUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$AvatarUploadUrlResponseFromJson(json);
}

