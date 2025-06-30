import 'package:dashboard/core/gen/assets/assets.gen.dart';
import 'package:dashboard/features/auth/data/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ログイン画面
///
/// 主な役割:
/// - ユーザーのログイン認証を行う
/// - Google認証や招待コード入力画面への遷移を提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(48),
              child: Card(
                color: colorScheme.primaryContainer,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: DefaultTextStyle(
                    style: TextStyle(color: colorScheme.onPrimaryContainer),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [
                        // ロゴやタイトル
                        Icon(
                          Icons.flutter_dash,
                          size: 120,
                          color: colorScheme.onPrimaryContainer,
                        ),
                        Text(
                          'FlutterKaigi 2025 Dashboard',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        // Googleログインボタン
                        _GoogleSignInButton(
                          onPressed: () async => ref
                              .read(authNotifierProvider.notifier)
                              .signInWithGoogle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      width: 210,
      height: 48,
      image: Assets.res.assets.googleSignInButton.provider(),
      fit: BoxFit.contain,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onPressed,
      ),
    );
  }
}
