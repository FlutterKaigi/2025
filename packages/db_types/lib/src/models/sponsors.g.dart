// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'sponsors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanySponsorDetail _$CompanySponsorDetailFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_CompanySponsorDetail',
  json,
  ($checkedConvert) {
    final val = _CompanySponsorDetail(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      logoUrl: $checkedConvert('logo_url', (v) => v as String),
      slug: $checkedConvert('slug', (v) => v as String),
      prText: $checkedConvert('pr_text', (v) => v as String),
      websiteUrl: $checkedConvert('website_url', (v) => v as String),
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
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => $enumDecode(_$OptionPlanTypeEnumMap, e))
                .toList() ??
            const [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'logoUrl': 'logo_url',
    'prText': 'pr_text',
    'websiteUrl': 'website_url',
    'sponsorType': 'sponsor_type',
    'basicPlanType': 'basic_plan_type',
    'optionPlanTypes': 'option_plan_types',
  },
);

Map<String, dynamic> _$CompanySponsorDetailToJson(
  _CompanySponsorDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logo_url': instance.logoUrl,
  'slug': instance.slug,
  'pr_text': instance.prText,
  'website_url': instance.websiteUrl,
  'sponsor_type': _$CompanySponsorTypeEnumMap[instance.sponsorType]!,
  'basic_plan_type': _$BasicPlanTypeEnumMap[instance.basicPlanType],
  'option_plan_types': instance.optionPlanTypes
      .map((e) => _$OptionPlanTypeEnumMap[e]!)
      .toList(),
};

const _$CompanySponsorTypeEnumMap = {
  CompanySponsorType.basic: 'basic',
  CompanySponsorType.community: 'community',
  CompanySponsorType.tool: 'tool',
  CompanySponsorType.none: 'none',
};

const _$BasicPlanTypeEnumMap = {
  BasicPlanType.platinum: 'platinum',
  BasicPlanType.gold: 'gold',
  BasicPlanType.silver: 'silver',
  BasicPlanType.bronze: 'bronze',
};

const _$OptionPlanTypeEnumMap = {
  OptionPlanType.namingRightsHall: 'naming_rights_hall',
  OptionPlanType.namingRightsRoom: 'naming_rights_room',
  OptionPlanType.nameplate: 'nameplate',
  OptionPlanType.lunch: 'lunch',
  OptionPlanType.scholarship: 'scholarship',
};

_IndividualSponsorDetail _$IndividualSponsorDetailFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_IndividualSponsorDetail',
  json,
  ($checkedConvert) {
    final val = _IndividualSponsorDetail(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      slug: $checkedConvert('slug', (v) => v as String),
      logoUrl: $checkedConvert('logo_url', (v) => v as String),
      enthusiasm: $checkedConvert('enthusiasm', (v) => v as String?),
      xAccount: $checkedConvert('x_account', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'logoUrl': 'logo_url', 'xAccount': 'x_account'},
);

Map<String, dynamic> _$IndividualSponsorDetailToJson(
  _IndividualSponsorDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'logo_url': instance.logoUrl,
  'enthusiasm': instance.enthusiasm,
  'x_account': instance.xAccount,
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
