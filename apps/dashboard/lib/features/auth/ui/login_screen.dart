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

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Card.outlined(
              child: Padding(
                padding: const EdgeInsets.all(36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 24,
                  children: [
                    Assets.res.assets.logo.image(
                      height: 160,
                      fit: BoxFit.fitHeight,
                    ),
                    Text(
                      'FlutterKaigi 2025 Dashboard',
                      style: theme.textTheme.titleMedium,
                    ),
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
