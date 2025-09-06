import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ForceUpdateChecker {
  const ForceUpdateChecker(this._client);

  final BffApiClient _client;

  Future<void> checkAndShowUpdateDialog(BuildContext context) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final platform = Platform.isIOS ? 'ios' : 'android';

    try {
      final response = await _client.v1.appVersion.checkVersion();
      final versionInfo = response.data;

      final currentVersion = packageInfo.version;
      final minimumVersion = versionInfo.minimumVersion;

      if (_isUpdateRequired(currentVersion, minimumVersion)) {
        if (context.mounted) {
          await _showForceUpdateDialog(context, versionInfo, platform);
        }
      } else if (_isOptionalUpdateAvailable(
          currentVersion, versionInfo.latestVersion)) {
        if (context.mounted) {
          await _showOptionalUpdateDialog(context, versionInfo, platform);
        }
      }
    } on Exception catch (e) {
      // エラー時はアップデートチェックをスキップ
      debugPrint('Version check failed: $e');
    }
  }

  bool _isUpdateRequired(String currentVersion, String minimumVersion) {
    return _compareVersions(currentVersion, minimumVersion) < 0;
  }

  bool _isOptionalUpdateAvailable(String currentVersion, String latestVersion) {
    return _compareVersions(currentVersion, latestVersion) < 0;
  }

  int _compareVersions(String v1, String v2) {
    final parts1 = v1.split('.').map(int.parse).toList();
    final parts2 = v2.split('.').map(int.parse).toList();

    for (var i = 0; i < 3; i++) {
      final p1 = i < parts1.length ? parts1[i] : 0;
      final p2 = i < parts2.length ? parts2[i] : 0;
      if (p1 < p2) {
        return -1;
      }
      if (p1 > p2) {
        return 1;
      }
    }
    return 0;
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

  Future<void> _showOptionalUpdateDialog(
    BuildContext context,
    AppVersionResponse response,
    String platform,
  ) async {
    final storeUrl = response.storeUrls[platform] ?? '';

    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('新しいバージョンが利用可能です'),
        content: Text(response.message['ja'] ?? '最新版にアップデートできます'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('後で'),
          ),
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