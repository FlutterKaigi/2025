import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:flutter/material.dart';

/// ログインを促すカードウィジェット
class LoginPromptCard extends StatelessWidget {
  const LoginPromptCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = Translations.of(context);

    return Center(
      child: Card.outlined(
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 24,
            children: [
              Assets.res.assets.logo.image(
                height: 120,
                fit: BoxFit.fitHeight,
              ),
              Text(
                t.account.loginRequired.title,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                t.account.loginRequired.description,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              FilledButton.icon(
                onPressed: () async => const LoginRoute().push(context),
                icon: const Icon(Icons.login),
                label: Text(t.account.loginRequired.button),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
