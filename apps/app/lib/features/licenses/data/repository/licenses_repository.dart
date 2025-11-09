import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'licenses_repository.g.dart';

@Riverpod(keepAlive: true)
LicensesRepository licensesRepository(Ref ref) => const LicensesRepository();

class LicensesRepository {
  const LicensesRepository();

  Future<Map<String, List<List<LicenseParagraph>>>> getLicenses() async {
    final licenses = await LicenseRegistry.licenses.toList();
    final licenseMap = <String, List<List<LicenseParagraph>>>{};
    for (final entry in licenses) {
      for (final element in entry.packages) {
        if (licenseMap.containsKey(element)) {
          licenseMap[element]!.add(entry.paragraphs.toList());
        } else {
          licenseMap[element] = [entry.paragraphs.toList()];
        }
      }
    }
    return SplayTreeMap.from(
      licenseMap,
    );
  }
}
