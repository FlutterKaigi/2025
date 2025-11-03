// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'job_boards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobBoards _$JobBoardsFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_JobBoards',
  json,
  ($checkedConvert) {
    final val = _JobBoards(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      url: $checkedConvert('url', (v) => v as String),
      altText: $checkedConvert('alt_text', (v) => v as String),
      imageName: $checkedConvert('image_name', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'altText': 'alt_text', 'imageName': 'image_name'},
);

Map<String, dynamic> _$JobBoardsToJson(_JobBoards instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'alt_text': instance.altText,
      'image_name': instance.imageName,
    };
