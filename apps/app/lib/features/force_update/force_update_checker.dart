import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:pub_semver/pub_semver.dart';

class ForceUpdateChecker {
  const ForceUpdateChecker(this._client);

  final BffApiClient _client;

  Future<AppVersionResponse?> checkVersion() async {
    try {
      final response = await _client.v1.appVersion.checkVersion();
      return response.data;
    } on Exception catch (e) {
      debugPrint('Version check failed: $e');
      return null;
    }
  }

  bool isUpdateRequired(String currentVersion, String minimumVersion) {
    final current = Version.parse(currentVersion);
    final minimum = Version.parse(minimumVersion);
    return current < minimum;
  }
}
