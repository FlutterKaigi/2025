// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'company_members.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyMembers _$CompanyMembersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CompanyMembers',
      json,
      ($checkedConvert) {
        final val = _CompanyMembers(
          companyId: $checkedConvert('company_id', (v) => (v as num).toInt()),
          userId: $checkedConvert('user_id', (v) => v as String),
          joinedAt: $checkedConvert(
            'joined_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'companyId': 'company_id',
        'userId': 'user_id',
        'joinedAt': 'joined_at',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$CompanyMembersToJson(
  _CompanyMembers instance,
) => <String, dynamic>{
  'company_id': instance.companyId,
  'user_id': instance.userId,
  'joined_at': const RequiredDateTimeConverter().toJson(instance.joinedAt),
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};
