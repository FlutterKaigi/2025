// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'job_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobBoard _$JobBoardFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_JobBoard', json, ($checkedConvert) {
      final val = _JobBoard(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        url: $checkedConvert('url', (v) => v as String),
        altText: $checkedConvert('alt_text', (v) => v as String),
        imageUrl: $checkedConvert('image_url', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'altText': 'alt_text', 'imageUrl': 'image_url'});

Map<String, dynamic> _$JobBoardToJson(_JobBoard instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'alt_text': instance.altText,
  'image_url': instance.imageUrl,
};
