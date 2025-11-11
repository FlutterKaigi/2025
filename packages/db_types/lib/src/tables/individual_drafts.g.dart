// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'individual_drafts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IndividualDrafts _$IndividualDraftsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_IndividualDrafts',
      json,
      ($checkedConvert) {
        final val = _IndividualDrafts(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          individualId: $checkedConvert(
            'individual_id',
            (v) => (v as num).toInt(),
          ),
          logoName: $checkedConvert('logo_name', (v) => v as String?),
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
        'individualId': 'individual_id',
        'logoName': 'logo_name',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$IndividualDraftsToJson(
  _IndividualDrafts instance,
) => <String, dynamic>{
  'id': instance.id,
  'individual_id': instance.individualId,
  'logo_name': instance.logoName,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const RequiredDateTimeConverter().toJson(instance.updatedAt),
};

_IndividualDraftApprovals _$IndividualDraftApprovalsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_IndividualDraftApprovals',
  json,
  ($checkedConvert) {
    final val = _IndividualDraftApprovals(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      individualDraftId: $checkedConvert(
        'individual_draft_id',
        (v) => (v as num).toInt(),
      ),
      approvedById: $checkedConvert('approved_by_id', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'individualDraftId': 'individual_draft_id',
    'approvedById': 'approved_by_id',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$IndividualDraftApprovalsToJson(
  _IndividualDraftApprovals instance,
) => <String, dynamic>{
  'id': instance.id,
  'individual_draft_id': instance.individualDraftId,
  'approved_by_id': instance.approvedById,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};
