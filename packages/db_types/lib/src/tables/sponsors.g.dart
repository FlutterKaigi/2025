// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'sponsors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SponsorCompanies _$SponsorCompaniesFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_SponsorCompanies',
      json,
      ($checkedConvert) {
        final val = _SponsorCompanies(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          companyId: $checkedConvert('company_id', (v) => (v as num).toInt()),
          sponsorType: $checkedConvert(
            'sponsor_type',
            (v) => $enumDecode(_$CompanySponsorTypeEnumMap, v),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => const RequiredDateTimeConverter().fromJson(v),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'companyId': 'company_id',
        'sponsorType': 'sponsor_type',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$SponsorCompaniesToJson(
  _SponsorCompanies instance,
) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'sponsor_type': _$CompanySponsorTypeEnumMap[instance.sponsorType]!,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};

const _$CompanySponsorTypeEnumMap = {
  CompanySponsorType.basic: 'basic',
  CompanySponsorType.community: 'community',
  CompanySponsorType.tool: 'tool',
  CompanySponsorType.none: 'none',
};

_BasicSponsorCompanies _$BasicSponsorCompaniesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_BasicSponsorCompanies',
  json,
  ($checkedConvert) {
    final val = _BasicSponsorCompanies(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      sponsorCompanyId: $checkedConvert(
        'sponsor_company_id',
        (v) => (v as num).toInt(),
      ),
      basicPlanType: $checkedConvert(
        'basic_plan_type',
        (v) => $enumDecode(_$BasicPlanTypeEnumMap, v),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'sponsorCompanyId': 'sponsor_company_id',
    'basicPlanType': 'basic_plan_type',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$BasicSponsorCompaniesToJson(
  _BasicSponsorCompanies instance,
) => <String, dynamic>{
  'id': instance.id,
  'sponsor_company_id': instance.sponsorCompanyId,
  'basic_plan_type': _$BasicPlanTypeEnumMap[instance.basicPlanType]!,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};

const _$BasicPlanTypeEnumMap = {
  BasicPlanType.platinum: 'platinum',
  BasicPlanType.gold: 'gold',
  BasicPlanType.silver: 'silver',
  BasicPlanType.bronze: 'bronze',
};

_SponsorCompanyOptions _$SponsorCompanyOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_SponsorCompanyOptions',
  json,
  ($checkedConvert) {
    final val = _SponsorCompanyOptions(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      sponsorCompanyId: $checkedConvert(
        'sponsor_company_id',
        (v) => (v as num).toInt(),
      ),
      optionPlanType: $checkedConvert(
        'option_plan_type',
        (v) => $enumDecode(_$OptionPlanTypeEnumMap, v),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'sponsorCompanyId': 'sponsor_company_id',
    'optionPlanType': 'option_plan_type',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$SponsorCompanyOptionsToJson(
  _SponsorCompanyOptions instance,
) => <String, dynamic>{
  'id': instance.id,
  'sponsor_company_id': instance.sponsorCompanyId,
  'option_plan_type': _$OptionPlanTypeEnumMap[instance.optionPlanType]!,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};

const _$OptionPlanTypeEnumMap = {
  OptionPlanType.namingRightsHall: 'naming_rights_hall',
  OptionPlanType.namingRightsRoom: 'naming_rights_room',
  OptionPlanType.nameplate: 'nameplate',
  OptionPlanType.lunch: 'lunch',
  OptionPlanType.scholarship: 'scholarship',
};

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

_CompanySponsorDetail _$CompanySponsorDetailFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_CompanySponsorDetail',
  json,
  ($checkedConvert) {
    final val = _CompanySponsorDetail(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      logoName: $checkedConvert('logo_name', (v) => v as String),
      sponsorType: $checkedConvert(
        'sponsor_type',
        (v) => $enumDecode(_$CompanySponsorTypeEnumMap, v),
      ),
      basicPlanType: $checkedConvert(
        'basic_plan_type',
        (v) => $enumDecodeNullable(_$BasicPlanTypeEnumMap, v),
      ),
      optionPlanTypes: $checkedConvert(
        'option_plan_types',
        (v) => (v as List<dynamic>?)
            ?.map((e) => $enumDecode(_$OptionPlanTypeEnumMap, e))
            .toList(),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'logoName': 'logo_name',
    'sponsorType': 'sponsor_type',
    'basicPlanType': 'basic_plan_type',
    'optionPlanTypes': 'option_plan_types',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$CompanySponsorDetailToJson(
  _CompanySponsorDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logo_name': instance.logoName,
  'sponsor_type': _$CompanySponsorTypeEnumMap[instance.sponsorType]!,
  'basic_plan_type': _$BasicPlanTypeEnumMap[instance.basicPlanType],
  'option_plan_types': instance.optionPlanTypes
      ?.map((e) => _$OptionPlanTypeEnumMap[e]!)
      .toList(),
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};

_IndividualSponsorDetail _$IndividualSponsorDetailFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_IndividualSponsorDetail',
  json,
  ($checkedConvert) {
    final val = _IndividualSponsorDetail(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      userName: $checkedConvert('user_name', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'userName': 'user_name', 'createdAt': 'created_at'},
);

Map<String, dynamic> _$IndividualSponsorDetailToJson(
  _IndividualSponsorDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_name': instance.userName,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};

_SponsorSummary _$SponsorSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_SponsorSummary',
      json,
      ($checkedConvert) {
        final val = _SponsorSummary(
          companySponsors: $checkedConvert(
            'company_sponsors',
            (v) => (v as List<dynamic>)
                .map(
                  (e) =>
                      CompanySponsorDetail.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
          individualSponsors: $checkedConvert(
            'individual_sponsors',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => IndividualSponsorDetail.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'companySponsors': 'company_sponsors',
        'individualSponsors': 'individual_sponsors',
      },
    );

Map<String, dynamic> _$SponsorSummaryToJson(_SponsorSummary instance) =>
    <String, dynamic>{
      'company_sponsors': instance.companySponsors,
      'individual_sponsors': instance.individualSponsors,
    };
