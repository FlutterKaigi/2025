// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'news_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsListResponse _$NewsListResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_NewsListResponse', json, ($checkedConvert) {
      final val = _NewsListResponse(
        news: $checkedConvert(
          'news',
          (v) => (v as List<dynamic>)
              .map((e) => News.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$NewsListResponseToJson(_NewsListResponse instance) =>
    <String, dynamic>{'news': instance.news};
