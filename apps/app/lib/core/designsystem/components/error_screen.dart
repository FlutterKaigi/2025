import 'package:app/core/api/api_exception.dart';
import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';

/// エラー表示画面
///
/// サーバーエラーなどが発生した際に表示されるページ
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    required this.error,
    required this.onRetry,
    super.key,
  });

  final Object error;

  /// リトライボタンが押された時のコールバック
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = Translations.of(context);

    final errorMessage = switch (error) {
      DioException _ => t.common.error.server.message,
      Object() => t.common.error.general.occurred,
    };

    final errorDetail = switch (error) {
      ApiErrorResponseException(:final errorResponse) =>
        '${errorResponse.code.name.toUpperCase()}: ${errorResponse.message}',
      _ => () {
        final text = error.toString();
        if (text.length >= 200) {
          return '${text.substring(0, 200)}...';
        }
        return text;
      }(),
    };

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                spacing: 16,
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
                    errorMessage,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    errorDetail,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    t.common.error.server.message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // リトライボタン
                  FilledButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh),
                    label: Text(t.common.error.server.retry),
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
