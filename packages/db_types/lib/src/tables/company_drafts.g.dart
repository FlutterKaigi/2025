// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'company_drafts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyDrafts _$CompanyDraftsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CompanyDrafts',
      json,
      ($checkedConvert) {
        final val = _CompanyDrafts(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          companyId: $checkedConvert('company_id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          slug: $checkedConvert('slug', (v) => v as String),
          logoName: $checkedConvert('logo_name', (v) => v as String?),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'companyId': 'company_id',
        'logoName': 'logo_name',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$CompanyDraftsToJson(_CompanyDrafts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'name': instance.name,
      'slug': instance.slug,
      'logo_name': instance.logoName,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_CompanyDraftApprovals _$CompanyDraftApprovalsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_CompanyDraftApprovals',
  json,
  ($checkedConvert) {
    final val = _CompanyDraftApprovals(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      companyDraftId: $checkedConvert(
        'company_draft_id',
        (v) => (v as num).toInt(),
      ),
      approvedById: $checkedConvert('approved_by_id', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'companyDraftId': 'company_draft_id',
    'approvedById': 'approved_by_id',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$CompanyDraftApprovalsToJson(
  _CompanyDraftApprovals instance,
) => <String, dynamic>{
  'id': instance.id,
  'company_draft_id': instance.companyDraftId,
  'approved_by_id': instance.approvedById,
  'created_at': instance.createdAt.toIso8601String(),
};
