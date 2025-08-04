import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sponsors.freezed.dart';
part 'sponsors.g.dart';

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

@freezed
abstract class SponsorNamingRights with _$SponsorNamingRights {
  const factory SponsorNamingRights({
    required int id,
    required int companyId,
    required String type,
    required String name,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _SponsorNamingRights;

  factory SponsorNamingRights.fromJson(Map<String, dynamic> json) =>
      _$SponsorNamingRightsFromJson(json);
}

@freezed
abstract class SponsorNameplate with _$SponsorNameplate {
  const factory SponsorNameplate({
    required int id,
    required int companyId,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _SponsorNameplate;

  factory SponsorNameplate.fromJson(Map<String, dynamic> json) =>
      _$SponsorNameplateFromJson(json);
}

@freezed
abstract class SponsorLunch with _$SponsorLunch {
  const factory SponsorLunch({
    required int id,
    required int companyId,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _SponsorLunch;

  factory SponsorLunch.fromJson(Map<String, dynamic> json) =>
      _$SponsorLunchFromJson(json);
}

@freezed
abstract class SponsorScholarship with _$SponsorScholarship {
  const factory SponsorScholarship({
    required int id,
    required int companyId,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _SponsorScholarship;

  factory SponsorScholarship.fromJson(Map<String, dynamic> json) =>
      _$SponsorScholarshipFromJson(json);
}
