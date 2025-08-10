import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sponsors.freezed.dart';
part 'sponsors.g.dart';

/// 企業スポンサーの種類
enum CompanySponsorType {
  @JsonValue('basic')
  basic,
  @JsonValue('community')
  community,
  @JsonValue('tool')
  tool,
  @JsonValue('none')
  none,
}

/// ベーシックプランの種類
enum BasicPlanType {
  @JsonValue('platinum')
  platinum,
  @JsonValue('gold')
  gold,
  @JsonValue('silver')
  silver,
  @JsonValue('bronze')
  bronze,
}

/// オプションプランの種類
enum OptionPlanType {
  @JsonValue('naming_rights_hall')
  namingRightsHall,
  @JsonValue('naming_rights_room')
  namingRightsRoom,
  @JsonValue('nameplate')
  nameplate,
  @JsonValue('lunch')
  lunch,
  @JsonValue('scholarship')
  scholarship,
}

/// 企業スポンサー
@freezed
abstract class SponsorCompanies with _$SponsorCompanies {
  const factory SponsorCompanies({
    required int id,
    required int companyId,
    required CompanySponsorType sponsorType,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _SponsorCompanies;

  factory SponsorCompanies.fromJson(Map<String, dynamic> json) =>
      _$SponsorCompaniesFromJson(json);
}

/// ベーシックスポンサー専用テーブル
@freezed
abstract class BasicSponsorCompanies with _$BasicSponsorCompanies {
  const factory BasicSponsorCompanies({
    required int id,
    required int sponsorCompanyId,
    required BasicPlanType basicPlanType,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _BasicSponsorCompanies;

  factory BasicSponsorCompanies.fromJson(Map<String, dynamic> json) =>
      _$BasicSponsorCompaniesFromJson(json);
}

/// 企業スポンサーのオプションプラン契約
@freezed
abstract class SponsorCompanyOptions with _$SponsorCompanyOptions {
  const factory SponsorCompanyOptions({
    required int id,
    required int sponsorCompanyId,
    required OptionPlanType optionPlanType,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _SponsorCompanyOptions;

  factory SponsorCompanyOptions.fromJson(Map<String, dynamic> json) =>
      _$SponsorCompanyOptionsFromJson(json);
}

/// 個人スポンサー
@freezed
abstract class SponsorIndividuals with _$SponsorIndividuals {
  const factory SponsorIndividuals({
    required int id,
    required int individualId,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _SponsorIndividuals;

  factory SponsorIndividuals.fromJson(Map<String, dynamic> json) =>
      _$SponsorIndividualsFromJson(json);
}

/// 企業スポンサーの詳細情報（企業情報とスポンサー情報を結合）
@freezed
abstract class CompanySponsorDetail with _$CompanySponsorDetail {
  const factory CompanySponsorDetail({
    required int id,
    required String name,
    required String logoName,
    required CompanySponsorType sponsorType,
    BasicPlanType? basicPlanType,
    List<OptionPlanType>? optionPlanTypes,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _CompanySponsorDetail;

  factory CompanySponsorDetail.fromJson(Map<String, dynamic> json) =>
      _$CompanySponsorDetailFromJson(json);
}

/// 個人スポンサーの詳細情報（個人情報とスポンサー情報を結合）
@freezed
abstract class IndividualSponsorDetail with _$IndividualSponsorDetail {
  const factory IndividualSponsorDetail({
    required int id,
    required String? userName,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _IndividualSponsorDetail;

  factory IndividualSponsorDetail.fromJson(Map<String, dynamic> json) =>
      _$IndividualSponsorDetailFromJson(json);
}

/// スポンサー情報のサマリー
@freezed
abstract class SponsorSummary with _$SponsorSummary {
  const factory SponsorSummary({
    required List<CompanySponsorDetail> companySponsors,
    required List<IndividualSponsorDetail> individualSponsors,
  }) = _SponsorSummary;

  factory SponsorSummary.fromJson(Map<String, dynamic> json) =>
      _$SponsorSummaryFromJson(json);
}
