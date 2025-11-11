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
        '${errorResponse.code.name}: ${errorResponse.message}',
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

/// エラー表示ダイアログ
class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    required this.error,
    super.key,
  });

  final Object error;

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

    return AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: theme.colorScheme.error,
          ),
          const SizedBox(width: 8),
          const Text('エラー'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ダシュマル画像
          Center(
            child: Assets.res.assets.dashumaruMagao.image(
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),
          // エラーメッセージ
          Text(
            errorMessage,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            errorDetail,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('閉じる'),
        ),
      ],
    );
  }

  /// エラーダイアログを表示する
  static Future<void> show(BuildContext context, Object error) {
    return showDialog<void>(
      context: context,
      builder: (context) => ErrorDialog(error: error),
    );
  }
}

extension ExceptionExtension on Exception {
  String errorMessage(Translations t) => switch (this) {
    final ApiException exception => ApiExceptionExtension(
      exception,
    ).errorMessage(t),
    Object() => t.common.error.general.occurred,
  };
}
