import 'package:app/features/licenses/data/repository/licenses_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'licenses_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Map<String, List<List<LicenseParagraph>>>> licenses(
  Ref ref,
) async => ref.watch(licensesRepositoryProvider).getLicenses();
