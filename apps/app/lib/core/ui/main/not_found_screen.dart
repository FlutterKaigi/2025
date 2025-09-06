import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/router/router.dart';
import 'package:flutter/material.dart';

/// 404 Not Found ページ
///
/// 存在しないURLにアクセスした際に表示されるページ
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  Assets.res.assets.dashumaruGuruguru.image(
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 32),

                  // エラーメッセージ
                  Text(
                    'ページが見つかりません',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),

                  Text(
                    'お探しのページは存在しないか、\n移動された可能性があります。',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // トップに戻るボタン
                  FilledButton.icon(
                    onPressed: () => const EventInfoRoute().go(context),
                    icon: const Icon(Icons.home),
                    label: const Text('トップに戻る'),
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
