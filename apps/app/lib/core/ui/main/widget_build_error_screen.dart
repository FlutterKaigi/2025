import 'dart:async';

import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/l10n/l10n.dart';
import 'package:app/core/router/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

/// Widgetのbuildメソッドでエラーが発生した際の表示画面
///
/// ErrorWidget.builderで表示される画面で、Widgetの構築中に
/// エラーが発生した際にユーザーに適切なフィードバックを提供
class WidgetBuildErrorScreen extends StatelessWidget {
  const WidgetBuildErrorScreen({
    required this.details,
    super.key,
  });

  final FlutterErrorDetails details;

  /// GitHubのIssue一覧ページを開く
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
      return Material(
        color: Colors.white30,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: _CalloutErrorWidget(details: details),
          ),
        ),
      );
    }

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
                  // ダシュマル画像（dashumaruOverflow2の代わりにdashumaruMagaoを使用）
                  Assets.res.assets.dashumaruMagao.image(
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 32),

                  // エラータイトル
                  Text(
                    '予期しないエラーが発生しました',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),

                  // 開発者向けメッセージ
                  Text(
                    '申し訳ございません。開発者のエラーハンドリングの実装が漏れていて、予期しないエラーが発生しました。\n\nこの問題を解決するため、GitHubのIssueを作成していただけると大変助かります。',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // GitHubのIssue一覧ページを開くボタン
                  FilledButton.icon(
                    onPressed: () => _openGitHubIssue(context),
                    icon: const Icon(Icons.bug_report),
                    label: const Text('GitHubのIssueページを開く'),
                    style: FilledButton.styleFrom(
                      backgroundColor: theme.colorScheme.secondary,
                      foregroundColor: theme.colorScheme.onSecondary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // トップに戻るボタン
                  FilledButton.icon(
                    onPressed: () => const EventInfoRoute().go(context),
                    icon: const Icon(Icons.home),
                    label: Text(l10n.notFoundBackToTop),
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

/// コールアウトエラー表示用のウィジェット
class _CalloutErrorWidget extends StatelessWidget {
  const _CalloutErrorWidget({
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
