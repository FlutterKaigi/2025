import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/l10n/l10n.dart';
import 'package:app/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// エラーハンドリング漏れ表示画面
///
/// エラーハンドリング漏れなど、開発者の実装ミスが原因で発生した
/// 予期しないエラーが発生した際に表示されるページ
class UnhandledErrorScreen extends StatelessWidget {
  const UnhandledErrorScreen({super.key});

  /// GitHubのIssue一覧ページを開く
  Future<void> _openGitHubIssue(BuildContext context) async {
    const githubIssueUrl = 'https://github.com/FlutterKaigi/2025/issues';
    final uri = Uri.parse(githubIssueUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('GitHubのIssue一覧ページを開けませんでした'),
          ),
        );
      }
    }
  }

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
