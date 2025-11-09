import 'dart:io';

import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/assets/fonts.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/provider/environment.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:app/features/force_update/force_update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ログイン画面
///
/// 主な役割:
/// - Googleセッション切れ時の再ログインを行う
/// - Google認証への遷移を提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/app/SCREENS.md)
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final t = Translations.of(context);

    useEffect(() {
      // セッション切れまたはidentity_already_existsエラーのクエリパラメータをチェックしてメッセージ表示
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final uri = GoRouterState.of(context).uri;
        final queryParameters = uri.queryParameters;
        final t = Translations.of(context);

        if (context.mounted) {
          if (queryParameters['session_expired'] == 'true') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  t.auth.error.sessionExpired,
                ),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 5),
              ),
            );
          } else if (queryParameters['identity_already_exists'] == 'true') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  t.auth.error.identityAlreadyExists,
                ),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 5),
              ),
            );
          }
        }
      });
      return null;
    }, []);

    final flavor = ref.watch(environmentProvider).flavor;

    return ForceUpdateDialogListener(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            t.common.app.name,
            style: theme.textTheme.titleLarge!.copyWith(
              fontFamily: FontFamily.notoSansMono,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
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
                      IntrinsicWidth(
                        child: Column(
                          spacing: 8,
                          children: [
                            _GoogleSignInButton(
                              onPressed: () async => ref
                                  .read(authProvider.notifier)
                                  .signInWithGoogle(),
                            ),
                            if (flavor == Flavor.production &&
                                !kIsWeb &&
                                (Platform.isIOS || Platform.isMacOS))
                              _AppleSignInButton(
                                onPressed: () async => ref
                                    .read(authProvider.notifier)
                                    .signInWithApple(),
                              ),
                          ],
                        ),
                      ),
                    ],
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

class _AppleSignInButton extends StatelessWidget {
  const _AppleSignInButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
      ),
      icon: const Icon(
        Icons.apple,
        size: 32,
      ),
      label: const Text(
        'Sign in with Apple',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
