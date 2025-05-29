import 'package:dashboard/features/auth/data/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// メイン画面
///
/// 主な役割:
/// - アプリの主要なタブ画面（イベント・スポンサー・アカウント）を統括する
/// - 各タブへのナビゲーションを提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return switch (authState) {
      AsyncData(value: final user) when user != null => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text(
              'You are logged in as '
              '${user.email}: '
              '${user.userMetadata?["full_name"]}',
            ),
            CircleAvatar(
              foregroundImage: NetworkImage(
                user.userMetadata?['avatar_url'].toString() ?? '',
              ),
              radius: 48,
            ),
            FilledButton(
              onPressed:
                  () => ref.read(authNotifierProvider.notifier).signOut(),
              child: const Text('ログアウト'),
            ),
          ],
        ),
      ),
      AsyncData() => const Center(child: Text('ログインしていません')),
      AsyncError(error: final error) => Center(child: Text(error.toString())),
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
    };
  }
}
