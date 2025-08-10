import 'package:dashboard/core/provider/bff_client.dart';
import 'package:dashboard/features/sponsor/data/sponsor.dart';
import 'package:db_types/db_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sponsor_provider.g.dart';

@riverpod
Future<List<Sponsor>> sponsors(Ref ref) async {
  final bffClient = ref.read(bffClientProvider);

  try {
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
  } on Exception catch (e) {
    // エラーの場合は空のリストを返す
    return <Sponsor>[];
  }
}

Sponsor _convertCompanySponsor(CompanySponsorDetail companySponsor) {
  final basicPlanType = companySponsor.basicPlanType;

  if (basicPlanType == null) {
    return OtherSponsor(
      id: companySponsor.id.toString(),
      name: companySponsor.name,
      slug: companySponsor.name.toLowerCase().replaceAll(' ', '-'),
      logoUrl: Uri.parse('https://placehold.co/400/png'),
      description: '${companySponsor.sponsorType.name} スポンサー',
      websiteUrl: Uri.parse('https://2025.flutterkaigi.jp'),
    );
  }

  switch (basicPlanType) {
    case BasicPlanType.platinum:
      return PlatinumSponsor(
        id: companySponsor.id.toString(),
        name: companySponsor.name,
        slug: companySponsor.name.toLowerCase().replaceAll(' ', '-'),
        logoUrl: Uri.parse('https://placehold.co/400/png'),
        description: 'プラチナスポンサー',
        websiteUrl: Uri.parse('https://2025.flutterkaigi.jp'),
      );
    case BasicPlanType.gold:
      return GoldSponsor(
        id: companySponsor.id.toString(),
        name: companySponsor.name,
        slug: companySponsor.name.toLowerCase().replaceAll(' ', '-'),
        logoUrl: Uri.parse('https://placehold.co/400/png'),
        description: 'ゴールドスポンサー',
        websiteUrl: Uri.parse('https://2025.flutterkaigi.jp'),
      );
    case BasicPlanType.silver:
      return SilverSponsor(
        id: companySponsor.id.toString(),
        name: companySponsor.name,
        slug: companySponsor.name.toLowerCase().replaceAll(' ', '-'),
        logoUrl: Uri.parse('https://placehold.co/400/png'),
        description: 'シルバースポンサー',
        websiteUrl: Uri.parse('https://2025.flutterkaigi.jp'),
      );
    case BasicPlanType.bronze:
      return BronzeSponsor(
        id: companySponsor.id.toString(),
        name: companySponsor.name,
        slug: companySponsor.name.toLowerCase().replaceAll(' ', '-'),
        logoUrl: Uri.parse('https://placehold.co/400/png'),
        description: 'ブロンズスポンサー',
        websiteUrl: Uri.parse('https://2025.flutterkaigi.jp'),
      );
  }
}

Sponsor _convertIndividualSponsor(IndividualSponsorDetail individualSponsor) {
  return IndividualSponsor(
    id: individualSponsor.id.toString(),
    name: individualSponsor.userName ?? '匿名',
    slug: (individualSponsor.userName ?? 'anonymous').toLowerCase().replaceAll(
      ' ',
      '-',
    ),
    logoUrl: Uri.parse('https://placehold.co/400/png'),
    enthusiasm: 'FlutterKaigi 2025を応援しています！',
    websiteUrl: Uri.parse('https://2025.flutterkaigi.jp'),
  );
}
