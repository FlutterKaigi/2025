import 'package:dashboard/features/auth/data/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dashboard/core/router/router.dart';

/// アカウント情報画面
///
/// 主な役割:
/// - ユーザーのアカウント情報を表示する
/// - プロフィール編集や退会申請画面への導線を提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _Body());
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
              onPressed: () =>
                  ref.read(authNotifierProvider.notifier).signOut(),
              child: const Text('ログアウト'),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => const ProfileEditRoute().go(context),
              child: const Text('プロフィール編集へ'),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () => const WithdrawalRoute().go(context),
              child: const Text('退会申請へ'),
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
