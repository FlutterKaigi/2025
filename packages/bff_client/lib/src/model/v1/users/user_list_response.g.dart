// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserListResponse _$UserListResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_UserListResponse',
      json,
      ($checkedConvert) {
        final val = _UserListResponse(
          users: $checkedConvert(
            'users',
            (v) =>
                (v as List<dynamic>)
                    .map(
                      (e) => UserListItem.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          ),
          totalCount: $checkedConvert('total_count', (v) => (v as num).toInt()),
          page: $checkedConvert('page', (v) => (v as num).toInt()),
          pageSize: $checkedConvert('page_size', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'totalCount': 'total_count', 'pageSize': 'page_size'},
    );

Map<String, dynamic> _$UserListResponseToJson(_UserListResponse instance) =>
    <String, dynamic>{
      'users': instance.users,
      'total_count': instance.totalCount,
      'page': instance.page,
      'page_size': instance.pageSize,
    };
