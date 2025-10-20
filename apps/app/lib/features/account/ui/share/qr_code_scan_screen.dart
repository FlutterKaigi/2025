import 'dart:async';

import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/account/data/notifier/profile_share_notifier.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// QRコードスキャン画面
///
/// 主な役割:
/// - QRコードをスキャンしてプロフィールシェアを作成
class QrCodeScanScreen extends HookConsumerWidget {
  const QrCodeScanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authAsync = ref.watch(authProvider);
    final t = Translations.of(context);
    final debugInputController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(t.account.profileshare.qrCodeScanScreen.title),
      ),
      body: switch (authAsync) {
        AsyncData(:final value?) when value.isAnonymous => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.qr_code_scanner,
                size: 64,
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              Text(
                t.account.profileshare.qrCodeScanScreen.loginRequired,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        AsyncData(value: null) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.qr_code_scanner,
                size: 64,
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              Text(
                t.account.profileshare.qrCodeScanScreen.loginRequired,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        AsyncData(:final value?) => Stack(
          children: [
            MobileScanner(
              onDetect: (capture) async {
                final barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  final code = barcode.rawValue;
                  if (code != null && code != value.id) {
                    await _showConnectionDialog(context, ref, code);
                  }
                }
              },
            ),
            // スキャン枠
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            // 画面下部の説明文
            Positioned(
              left: 0,
              right: 0,
              bottom: 120,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  t.account.profileshare.qrCodeScanScreen.instruction,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // デバッグ用入力フィールド (デバッグモードのみ表示)
            if (kDebugMode)
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        t.common.debug.profileShare.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: debugInputController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: t
                                    .common
                                    .debug
                                    .profileShare
                                    .userIdPlaceholder,
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () async {
                              final userId = debugInputController.text.trim();
                              if (userId.isNotEmpty && userId != value.id) {
                                await _showConnectionDialog(
                                  context,
                                  ref,
                                  userId,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                            child: Text(t.common.debug.profileShare.share),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        AsyncLoading() => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        AsyncError(:final error) => ErrorScreen(
          error: error,
          onRetry: () => ref.invalidate(authProvider),
        ),
      },
    );
  }

  Future<void> _showConnectionDialog(
    BuildContext context,
    WidgetRef ref,
    String userId,
  ) async {
    final t = Translations.of(context);

    final shouldConnect = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.account.profileshare.qrCodeScanScreen.confirmTitle),
        content: Text(t.account.profileshare.qrCodeScanScreen.confirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(t.account.profileshare.qrCodeScanScreen.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(t.account.profileshare.qrCodeScanScreen.connect),
          ),
        ],
      ),
    );

    if ((shouldConnect ?? false) && context.mounted) {
      await _executeConnection(context, ref, userId);
    }
  }

  Future<void> _executeConnection(
    BuildContext context,
    WidgetRef ref,
    String userId,
  ) async {
    final t = Translations.of(context);

    // ローディング表示
    unawaited(
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );

    try {
      final notifier = ref.read(profileShareProvider.notifier);
      await notifier.putProfileShare(userId);

      if (context.mounted) {
        Navigator.pop(context); // ローディング非表示

        // 成功メッセージ表示
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              t.account.profileshare.qrCodeScanScreen.successMessage,
            ),
            backgroundColor: Colors.green,
          ),
        );

        // 交換履歴一覧ページに遷移
        const ProfileShareListRoute().go(context);
      }
    } on Exception catch (_) {
      if (context.mounted) {
        Navigator.pop(context); // ローディング非表示

        // エラーメッセージ表示
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              t.account.profileshare.qrCodeScanScreen.errorMessage,
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
