// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'file_object_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileObjectAvatarKey _$FileObjectAvatarKeyFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FileObjectAvatarKey', json, ($checkedConvert) {
      final val = FileObjectAvatarKey(
        userId: $checkedConvert('user_id', (v) => v as String),
        uuid: $checkedConvert('uuid', (v) => v as String),
        extension: $checkedConvert('extension', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'userId': 'user_id'});

Map<String, dynamic> _$FileObjectAvatarKeyToJson(
  FileObjectAvatarKey instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'uuid': instance.uuid,
  'extension': instance.extension,
};
