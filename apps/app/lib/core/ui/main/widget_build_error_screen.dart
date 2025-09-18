import 'dart:async';

import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

/// Widget Build Error の表示画面
class WidgetBuildErrorScreen extends StatelessWidget {
  const WidgetBuildErrorScreen({
    required this.details,
    super.key,
  });

  final FlutterErrorDetails details;

  /// GitHub の Issue 一覧ページを開く
  Future<void> _openGitHubIssue(BuildContext context) async {
    const githubIssueUrl = 'https://github.com/FlutterKaigi/2025/issues';
    final uri = Uri.parse(githubIssueUrl);
    unawaited(
      launchUrl(uri, mode: LaunchMode.externalApplication),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      // デバッグモードでは必要最低限のみ表示
      return Material(
        color: Colors.white30,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: _WidgetBuildErrorCallout(details: details),
          ),
        ),
      );
    }

    final theme = Theme.of(context);
    final t = Translations.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ダシュマル画像
          Assets.res.assets.dashumaruOverflow2.image(
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 32),

          // エラータイトル
          Text(
            t.error.widget.buildErrorTitle,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.error,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // エラー詳細のコールアウト
          _WidgetBuildErrorCallout(details: details),
          const SizedBox(height: 24),

          // 開発者向けメッセージ
          Text(
            t.error.widget.buildErrorMessage,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // GitHub の Issue 一覧ページを開くボタン
          FilledButton.icon(
            onPressed: () => _openGitHubIssue(context),
            icon: const Icon(Icons.bug_report),
            label: Text(t.error.widget.buildErrorGitHubButton),
            style: FilledButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary,
              foregroundColor: theme.colorScheme.onSecondary,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget Build Error のコールアウト表示
///
/// 発生したエラーをクリップボードにコピーする機能を提供する
class _WidgetBuildErrorCallout extends StatelessWidget {
  const _WidgetBuildErrorCallout({
    required this.details,
    super.key,
  });

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    final exceptionText = details.exception.toString();
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.red.withValues(alpha: 0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Widget Build Error',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    exceptionText,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(text: exceptionText),
                    );
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(
                        const SnackBar(
                          content: Text('Successfully copied to clipboard!'),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.copy_all_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
