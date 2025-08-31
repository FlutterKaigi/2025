import 'package:app/core/provider/bff_client.dart';
import 'package:app/features/sponsor/data/sponsor.dart';
import 'package:db_types/db_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sponsor_provider.g.dart';

@riverpod
Future<List<Sponsor>> sponsors(Ref ref) async {
  final bffClient = ref.watch(bffClientProvider);
  final sponsorSummary = await bffClient.v1.sponsors.getSponsors();

  final sponsors = <Sponsor>[];

  // 企業スポンサーを変換
  for (final companySponsor in sponsorSummary.companySponsors) {
    sponsors.add(_convertCompanySponsor(companySponsor));
  }

  // 個人スポンサーを変換
  for (final individualSponsor in sponsorSummary.individualSponsors) {
    sponsors.add(_convertIndividualSponsor(individualSponsor));
  }

  return sponsors;
}

/// 企業スポンサーを変換
Sponsor _convertCompanySponsor(CompanySponsorDetail companySponsor) {
  final sponsorType = companySponsor.sponsorType;
  return switch (sponsorType) {
    CompanySponsorType.basic => _convertBasicSponsor(companySponsor),
    CompanySponsorType.tool => _convertToolSponsor(companySponsor),
    CompanySponsorType.community ||
    CompanySponsorType.none => _convertOtherSponsor(companySponsor),
  };
}

/// ベーシックプランのスポンサーを変換
Sponsor _convertBasicSponsor(CompanySponsorDetail companySponsor) {
  final basicPlanType = companySponsor.basicPlanType;
  return switch (basicPlanType) {
    BasicPlanType.platinum => _convertPlatinumSponsor(companySponsor),
    BasicPlanType.gold => _convertGoldSponsor(companySponsor),
    BasicPlanType.silver => _convertSilverSponsor(companySponsor),
    BasicPlanType.bronze => _convertBronzeSponsor(companySponsor),
    null => throw Exception('basic plan type is null'),
  };
}

/// プラチナスポンサーを変換
PlatinumSponsor _convertPlatinumSponsor(CompanySponsorDetail companySponsor) {
  return PlatinumSponsor(
    id: companySponsor.id.toString(),
    name: companySponsor.name,
    slug: companySponsor.slug,
    logoUrl: Uri.parse(companySponsor.logoUrl),
    prText: companySponsor.prText,
    websiteUrl: Uri.parse(companySponsor.websiteUrl),
    scholarship: companySponsor.isScholarship,
    namingRight: companySponsor.namingRight,
    namePlate: companySponsor.isNamePlate,
  );
}

/// ゴールドスポンサーを変換
GoldSponsor _convertGoldSponsor(CompanySponsorDetail companySponsor) {
  return GoldSponsor(
    id: companySponsor.id.toString(),
    name: companySponsor.name,
    slug: companySponsor.slug,
    logoUrl: Uri.parse(companySponsor.logoUrl),
    prText: companySponsor.prText,
    websiteUrl: Uri.parse(companySponsor.websiteUrl),
    scholarship: companySponsor.isScholarship,
    namingRight: companySponsor.namingRight,
    namePlate: companySponsor.isNamePlate,
  );
}

/// シルバースポンサーを変換
SilverSponsor _convertSilverSponsor(CompanySponsorDetail companySponsor) {
  return SilverSponsor(
    id: companySponsor.id.toString(),
    name: companySponsor.name,
    slug: companySponsor.slug,
    logoUrl: Uri.parse(companySponsor.logoUrl),
    prText: companySponsor.prText,
    websiteUrl: Uri.parse(companySponsor.websiteUrl),
    scholarship: companySponsor.isScholarship,
    namingRight: companySponsor.namingRight,
    namePlate: companySponsor.isNamePlate,
    lunchSponsor: companySponsor.isLunch,
  );
}

/// ブロンズスポンサーを変換
BronzeSponsor _convertBronzeSponsor(CompanySponsorDetail companySponsor) {
  return BronzeSponsor(
    id: companySponsor.id.toString(),
    name: companySponsor.name,
    slug: companySponsor.slug,
    logoUrl: Uri.parse(companySponsor.logoUrl),
    prText: companySponsor.prText,
    websiteUrl: Uri.parse(companySponsor.websiteUrl),
    scholarship: companySponsor.isScholarship,
    namePlate: companySponsor.isNamePlate,
    lunchSponsor: companySponsor.isLunch,
  );
}

/// ツールスポンサーを変換
ToolSponsor _convertToolSponsor(CompanySponsorDetail companySponsor) {
  return ToolSponsor(
    id: companySponsor.id.toString(),
    name: companySponsor.name,
    slug: companySponsor.slug,
    logoUrl: Uri.parse(companySponsor.logoUrl),
    prText: companySponsor.prText,
    websiteUrl: Uri.parse(companySponsor.websiteUrl),
  );
}

/// その他スポンサーを変換
OtherSponsor _convertOtherSponsor(CompanySponsorDetail companySponsor) {
  return OtherSponsor(
    id: companySponsor.id.toString(),
    name: companySponsor.name,
    slug: companySponsor.slug,
    logoUrl: Uri.parse(companySponsor.logoUrl),
    prText: companySponsor.prText,
    websiteUrl: Uri.parse(companySponsor.websiteUrl),
  );
}

/// 個人スポンサーを変換
IndividualSponsor _convertIndividualSponsor(
  IndividualSponsorDetail individualSponsor,
) {
  return IndividualSponsor(
    id: individualSponsor.id.toString(),
    name: individualSponsor.name,
    slug: individualSponsor.slug,
    logoUrl: Uri.parse(individualSponsor.logoUrl),
    enthusiasm: individualSponsor.enthusiasm,
    xAccount: individualSponsor.xAccount,
  );
}

extension on CompanySponsorDetail {
  NamingRight get namingRight {
    if (optionPlanTypes.contains(OptionPlanType.namingRightsHall)) {
      return HallNamingRight(name: name);
    }
    if (optionPlanTypes.contains(OptionPlanType.namingRightsRoom)) {
      return RoomNamingRight(name: name);
    }
    return const NotAppliedNamingRight();
  }

  bool get isScholarship =>
      optionPlanTypes.contains(OptionPlanType.scholarship);

  bool get isNamePlate => optionPlanTypes.contains(OptionPlanType.nameplate);

  bool get isLunch => optionPlanTypes.contains(OptionPlanType.lunch);
}
