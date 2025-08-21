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
