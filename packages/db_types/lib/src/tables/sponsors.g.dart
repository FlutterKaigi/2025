// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'sponsors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SponsorIndividuals _$SponsorIndividualsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_SponsorIndividuals',
      json,
      ($checkedConvert) {
        final val = _SponsorIndividuals(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          individualId: $checkedConvert(
            'individual_id',
            (v) => (v as num).toInt(),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'individualId': 'individual_id',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$SponsorIndividualsToJson(
  _SponsorIndividuals instance,
) => <String, dynamic>{
  'id': instance.id,
  'individual_id': instance.individualId,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};

_SponsorNamingRights _$SponsorNamingRightsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_SponsorNamingRights',
      json,
      ($checkedConvert) {
        final val = _SponsorNamingRights(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          companyId: $checkedConvert('company_id', (v) => (v as num).toInt()),
          createdAt: $checkedConvert(
            'created_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'companyId': 'company_id', 'createdAt': 'created_at'},
    );

Map<String, dynamic> _$SponsorNamingRightsToJson(
  _SponsorNamingRights instance,
) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};

_SponsorNameplate _$SponsorNameplateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_SponsorNameplate',
      json,
      ($checkedConvert) {
        final val = _SponsorNameplate(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          companyId: $checkedConvert('company_id', (v) => (v as num).toInt()),
          createdAt: $checkedConvert(
            'created_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'companyId': 'company_id', 'createdAt': 'created_at'},
    );

Map<String, dynamic> _$SponsorNameplateToJson(
  _SponsorNameplate instance,
) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};

_SponsorLunch _$SponsorLunchFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_SponsorLunch',
      json,
      ($checkedConvert) {
        final val = _SponsorLunch(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          companyId: $checkedConvert('company_id', (v) => (v as num).toInt()),
          createdAt: $checkedConvert(
            'created_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'companyId': 'company_id', 'createdAt': 'created_at'},
    );

Map<String, dynamic> _$SponsorLunchToJson(
  _SponsorLunch instance,
) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};

_SponsorScholarship _$SponsorScholarshipFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_SponsorScholarship',
      json,
      ($checkedConvert) {
        final val = _SponsorScholarship(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          companyId: $checkedConvert('company_id', (v) => (v as num).toInt()),
          createdAt: $checkedConvert(
            'created_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'companyId': 'company_id', 'createdAt': 'created_at'},
    );

Map<String, dynamic> _$SponsorScholarshipToJson(
  _SponsorScholarship instance,
) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};
