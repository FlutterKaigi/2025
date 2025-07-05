import 'package:dashboard/features/sponsor/data/sponsor.dart';
import 'package:faker/faker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sponsor_provider.g.dart';

@riverpod
Future<List<Sponsor>> sponsors(Ref ref) async {
  await Future<void>.delayed(const Duration(seconds: 1));
  final faker = Faker();

  final sponsors = <Sponsor>[];

  sponsors.addAll(
    List.generate(
      4,
      (i) => PlatinumSponsor(
        id: i.toString(),
        name: faker.company.name(),
        slug: faker.lorem.word() + i.toString(),
        logoUrl: Uri.parse(
          'https://placehold.co/400/png',
        ),
        description: faker.lorem.sentences(2).join(' '),
        websiteUrl: Uri.parse('https://2025.flutterkaigi.jp'),
      ),
    ),
  );

  sponsors.addAll(
    List.generate(
      6,
      (i) => GoldSponsor(
        id: (i + 10).toString(),
        name: faker.company.name(),
        slug: faker.lorem.word() + (i + 10).toString(),
        logoUrl: Uri.parse(
          'https://placehold.co/400/png',
        ),
        description: faker.lorem.sentences(2).join(' '),
        websiteUrl: Uri.parse('https://2025.flutterkaigi.jp'),
      ),
    ),
  );

  sponsors.addAll(
    List.generate(
      11,
      (i) => SilverSponsor(
        id: (i + 20).toString(),
        name: faker.company.name(),
        slug: faker.lorem.word() + (i + 20).toString(),
        logoUrl: Uri.parse(
          'https://placehold.co/400/png',
        ),
        description: faker.lorem.sentences(2).join(' '),
        websiteUrl: Uri.parse('https://2025.flutterkaigi.jp'),
      ),
    ),
  );

  sponsors.addAll(
    List.generate(
      20,
      (i) => BronzeSponsor(
        id: (i + 40).toString(),
        name: faker.company.name(),
        slug: faker.lorem.word() + (i + 40).toString(),
        logoUrl: Uri.parse(
          'https://placehold.co/400/png',
        ),
        description: faker.lorem.sentences(2).join(' '),
        websiteUrl: Uri.parse('https://2025.flutterkaigi.jp'),
      ),
    ),
  );

  sponsors.addAll(
    List.generate(
      5,
      (i) => OtherSponsor(
        id: (i + 60).toString(),
        name: faker.company.name(),
        slug: faker.lorem.word() + (i + 60).toString(),
        logoUrl: Uri.parse(
          'https://placehold.co/400/png',
        ),
        description: faker.lorem.sentences(2).join(' '),
        websiteUrl: Uri.parse('https://2025.flutterkaigi.jp'),
      ),
    ),
  );

  sponsors.addAll(
    List.generate(
      30,
      (i) => IndividualSponsor(
        id: (i + 70).toString(),
        name: faker.person.name(),
        slug: faker.internet.userName() + (i + 70).toString(),
        logoUrl: Uri.parse(
          'https://placehold.co/400/png',
        ),
        enthusiasm: faker.lorem.words(3).join(' '),
        websiteUrl: Uri.parse('https://2025.flutterkaigi.jp'),
      ),
    ),
  );

  return sponsors;
}
