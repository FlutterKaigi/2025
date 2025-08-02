import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/gen/assets/assets.gen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Assets.res.logo.image(
                      height: 160,
                      fit: BoxFit.fitHeight,
                    ),
                    Text(
                      'FlutterKaigi 2025',
                      style: theme.textTheme.titleMedium,
                    ),
                    _GoogleSignInButton(
                      onPressed: () async {
                        // Navigate to event screen after login
                        context.go('/event');
                      },
                    ),
                    _GuestSignInButton(
                      onPressed: () async {
                        // Navigate to event screen after login
                        context.go('/event');
                      },
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
      image: Assets.res.googleSignInButton.provider(),
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
          'ゲストとしてサインイン',
          style: theme.textTheme.labelLarge,
        ),
      ),
    );
  }
}