// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'company_invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyInvitation _$CompanyInvitationFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CompanyInvitation',
      json,
      ($checkedConvert) {
        final val = _CompanyInvitation(
          companyId: $checkedConvert('company_id', (v) => (v as num).toInt()),
          key: $checkedConvert('key', (v) => v as String),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => DateTime.parse(v as String),
          ),
          disabledAt: $checkedConvert(
            'disabled_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'companyId': 'company_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'disabledAt': 'disabled_at',
      },
    );

Map<String, dynamic> _$CompanyInvitationToJson(_CompanyInvitation instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'key': instance.key,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'disabled_at': instance.disabledAt?.toIso8601String(),
    };
