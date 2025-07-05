import 'package:dashboard/features/sponsor/data/sponsor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sponsor_provider.g.dart';

@riverpod
Future<List<Sponsor>> sponsors(Ref ref) async {
  await Future<void>.delayed(const Duration(seconds: 1));
  final sponsors = [
    PlatinumSponsor(
      id: '0',
      name: 'Flutter',
      slug: 'flutter',
      logoUrl: Uri.parse(
        'https://2024.flutterkaigi.jp/ogp.png',
      ),
      namingRight: const HallNamingRight(name: 'Hall 1'),
      namePlate: true,
    ),
    IndividualSponsor(
      id: '0',
      name: 'blendthink',
      slug: 'blendthink',
      logoUrl: Uri.parse(
        'https://avatars.githubusercontent.com/u/32213113?v=4',
      ),
    ),
  ];
  return sponsors;
}
