import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// エラー表示画面
///
/// サーバーエラーなどが発生した際に表示されるページ
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    required this.onRetry,
    super.key,
  });

  /// リトライボタンが押された時のコールバック
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = L10n.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ダシュマル画像
                  Assets.res.assets.dashumaruMagao.image(
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 32),

                  // エラーメッセージ
                  Text(
                    l10n.errorTitle,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),

                  Text(
                    l10n.errorMessage,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // リトライボタン
                  FilledButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh),
                    label: Text(l10n.errorRetry),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
