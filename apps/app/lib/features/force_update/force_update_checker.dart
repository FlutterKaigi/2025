import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> checkAndShowUpdateDialog(BuildContext context) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final platform = Platform.isIOS ? 'ios' : 'android';

    final versionInfo = await checkVersion();
    if (versionInfo == null) {
      return;
    }

    final currentVersion = packageInfo.version;
    final minimumVersion = versionInfo.minimumVersion;

    if (isUpdateRequired(currentVersion, minimumVersion)) {
      if (context.mounted) {
        await _showForceUpdateDialog(context, versionInfo, platform);
      }
    }
  }

  Future<void> _showForceUpdateDialog(
    BuildContext context,
    AppVersionResponse response,
    String platform,
  ) async {
    final storeUrl = response.storeUrls[platform] ?? '';

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('アップデートが必要です'),
        content: Text(response.message['ja'] ?? 'アプリをアップデートしてください'),
        actions: [
          TextButton(
            onPressed: () => _openStore(storeUrl),
            child: const Text('アップデート'),
          ),
        ],
      ),
    );
  }

  Future<void> _openStore(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
