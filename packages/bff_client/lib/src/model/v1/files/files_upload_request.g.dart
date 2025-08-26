// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'files_upload_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FilesUploadRequest _$FilesUploadRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FilesUploadRequest', json, ($checkedConvert) {
      final val = _FilesUploadRequest(
        variant: $checkedConvert(
          'variant',
          (v) => $enumDecode(_$FileVariantEnumMap, v),
        ),
        contentLength: $checkedConvert(
          'content_length',
          (v) => (v as num).toInt(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'contentLength': 'content_length'});

Map<String, dynamic> _$FilesUploadRequestToJson(_FilesUploadRequest instance) =>
    <String, dynamic>{
      'variant': _$FileVariantEnumMap[instance.variant]!,
      'content_length': instance.contentLength,
    };

const _$FileVariantEnumMap = {FileVariant.avatar: 'avatar'};
