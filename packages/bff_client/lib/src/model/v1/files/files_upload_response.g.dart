// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'files_upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileUploadResponse _$FileUploadResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FileUploadResponse', json, ($checkedConvert) {
      final val = _FileUploadResponse(
        url: $checkedConvert('url', (v) => v as String),
        key: $checkedConvert('key', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$FileUploadResponseToJson(_FileUploadResponse instance) =>
    <String, dynamic>{'url': instance.url, 'key': instance.key};
