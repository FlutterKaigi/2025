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
          companyId: $checkedConvert('company_id', (v) => (v as num?)?.toInt()),
          slug: $checkedConvert('slug', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          websiteUrl: $checkedConvert('website_url', (v) => v as String),
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
        'websiteUrl': 'website_url',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$CompanyDraftsToJson(
  _CompanyDrafts instance,
) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'slug': instance.slug,
  'description': instance.description,
  'website_url': instance.websiteUrl,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
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
      approvedBy: $checkedConvert('approved_by', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'companyDraftId': 'company_draft_id',
    'approvedBy': 'approved_by',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$CompanyDraftApprovalsToJson(
  _CompanyDraftApprovals instance,
) => <String, dynamic>{
  'id': instance.id,
  'company_draft_id': instance.companyDraftId,
  'approved_by': instance.approvedBy,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};
