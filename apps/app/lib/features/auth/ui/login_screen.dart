import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ログイン画面
///
/// 主な役割:
/// - ユーザーのログイン認証を行う
/// - Google認証や招待コード入力画面への遷移を提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/app/SCREENS.md)
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final t = Translations.of(context);

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
                      t.common.app.name,
                      style: theme.textTheme.titleMedium,
                    ),
                    _GoogleSignInButton(
                      onPressed: () async => ref
                          .read(authNotifierProvider.notifier)
                          .signInWithGoogle(),
                    ),
                    _GuestSignInButton(
                      onPressed: () async => ref
                          .read(authNotifierProvider.notifier)
                          .signInAnonymously(),
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

class _GuestSignInButton extends StatelessWidget {
  const _GuestSignInButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = Translations.of(context);

    return SizedBox(
      width: 210,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          t.auth.guest.signInButton,
          style: theme.textTheme.labelLarge,
        ),
      ),
    );
  }
}
