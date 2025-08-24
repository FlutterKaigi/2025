import 'package:db_types/src/tables/sponsors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sponsors.freezed.dart';
part 'sponsors.g.dart';

/// 企業スポンサーの詳細情報（企業情報とスポンサー情報を結合）
@freezed
abstract class CompanySponsorDetail with _$CompanySponsorDetail {
  const factory CompanySponsorDetail({
    required int id,
    required String name,
    required String logoUrl,
    required String slug,
    required String prText,
    required String websiteUrl,
    required CompanySponsorType sponsorType,
    BasicPlanType? basicPlanType,
    @Default([]) List<OptionPlanType> optionPlanTypes,
  }) = _CompanySponsorDetail;

  factory CompanySponsorDetail.fromJson(Map<String, dynamic> json) =>
      _$CompanySponsorDetailFromJson(json);
}

/// 個人スポンサーの詳細情報（個人情報とスポンサー情報を結合）
@freezed
abstract class IndividualSponsorDetail with _$IndividualSponsorDetail {
  const factory IndividualSponsorDetail({
    required int id,
    required String name,
    required String slug,
    required String logoUrl,
    String? enthusiasm,
    String? xAccount,
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
