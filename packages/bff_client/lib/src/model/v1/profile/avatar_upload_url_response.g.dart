// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'avatar_upload_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvatarUploadUrlResponse _$AvatarUploadUrlResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_AvatarUploadUrlResponse',
  json,
  ($checkedConvert) {
    final val = _AvatarUploadUrlResponse(
      uploadUrl: $checkedConvert('upload_url', (v) => v as String),
      avatarKey: $checkedConvert('avatar_key', (v) => v as String),
      expiresIn: $checkedConvert('expires_in', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'uploadUrl': 'upload_url',
    'avatarKey': 'avatar_key',
    'expiresIn': 'expires_in',
  },
);

Map<String, dynamic> _$AvatarUploadUrlResponseToJson(
  _AvatarUploadUrlResponse instance,
) => <String, dynamic>{
  'upload_url': instance.uploadUrl,
  'avatar_key': instance.avatarKey,
  'expires_in': instance.expiresIn,
};
