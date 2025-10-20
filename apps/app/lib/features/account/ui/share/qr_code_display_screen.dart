import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 自分のQRコードを表示する画面
///
/// 主な役割:
/// - 自分のユーザーIDをQRコードとして表示
/// - 他のユーザーがスキャンしてプロフィール交換できるようにする
class QrCodeDisplayScreen extends HookConsumerWidget {
  const QrCodeDisplayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authAsync = ref.watch(authProvider);
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.account.profileshare.qrCodeDisplay.title),
      ),
      body: switch (authAsync) {
        AsyncData(:final value?) when value.isAnonymous => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.login, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  t.auth.loginRequired,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        AsyncData(value: null) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.login, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  t.auth.loginRequired,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        AsyncData(:final value?) => Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: QrImageView(
                data: value.id,
                size: 280,
                backgroundColor: Colors.white,
                errorCorrectionLevel: QrErrorCorrectLevel.H,
              ),
            ),
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
}
