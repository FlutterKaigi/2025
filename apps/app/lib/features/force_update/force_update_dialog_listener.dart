import 'dart:async';

import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/force_update/force_update_provider.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ForceUpdateDialogListener extends ConsumerWidget {
  const ForceUpdateDialogListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(forceUpdateStateProvider, (previous, state) {
      if (state.isUpdateRequired &&
          state.versionInfo != null &&
          state.platform != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          unawaited(
            _showForceUpdateDialog(
              context,
              state.versionInfo!,
              state.platform!,
              ref,
            ),
          );
        });
      }
    });

    return child;
  }

  Future<void> _showForceUpdateDialog(
    BuildContext context,
    AppVersionResponse response,
    TargetPlatform platform,
    WidgetRef ref,
  ) async {
    final t = Translations.of(context);
    final storeUrl = switch (platform) {
      TargetPlatform.iOS => response.storeUrls.ios,
      TargetPlatform.android => response.storeUrls.android,
      _ => '',
    };

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(t.common.forceUpdate.title),
        content: Text(response.message['ja'] ?? t.common.forceUpdate.message),
        actions: [
          TextButton(
            onPressed: () => _openStore(storeUrl),
            child: Text(t.common.forceUpdate.updateButton),
          ),
        ],
      ),
    );

    // ダイアログ表示後に状態をリセット
    ref.read(forceUpdateStateProvider.notifier).markDialogShown();
  }

  Future<void> _openStore(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
