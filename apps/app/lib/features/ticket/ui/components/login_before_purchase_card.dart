import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:flutter/material.dart';

class LoginBeforePurchaseCard extends StatelessWidget {
  const LoginBeforePurchaseCard._({required this.type, super.key});

  factory LoginBeforePurchaseCard.login() =>
      const LoginBeforePurchaseCard._(type: LoginBeforePurchaseCardType.login);
  factory LoginBeforePurchaseCard.anonymous() =>
      const LoginBeforePurchaseCard._(
        type: LoginBeforePurchaseCardType.anonymous,
      );
  factory LoginBeforePurchaseCard.appleSignIn() =>
      const LoginBeforePurchaseCard._(
        type: LoginBeforePurchaseCardType.appleSignIn,
      );

  final LoginBeforePurchaseCardType type;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    return Card.outlined(
      color: theme.colorScheme.primaryContainer,
      surfaceTintColor: theme.colorScheme.onPrimaryContainer,
      margin: const EdgeInsets.all(8),
      child: DefaultTextStyle(
        style: theme.textTheme.bodyMedium!.copyWith(
          color: theme.colorScheme.onPrimaryContainer,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            spacing: 8,
            children: [
              Icon(
                Icons.info,
                size: 48,
                color: theme.colorScheme.onPrimaryContainer,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      type.title(t),
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                    Text(
                      type.description(t),
                    ),
                    FilledButton.icon(
                      label: Text(t.account.settings),
                      icon: const Icon(Icons.settings),
                      onPressed: () => const AccountInfoRoute().go(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum LoginBeforePurchaseCardType {
  login,
  anonymous,
  appleSignIn
  ;

  String title(Translations t) => switch (this) {
    login => t.ticket.loginRequired.title,
    anonymous => t.ticket.loginRequired.linkTitle,
    appleSignIn => t.ticket.loginRequired.appleSignInTitle,
  };
  String description(Translations t) => switch (this) {
    login || anonymous => t.ticket.loginRequired.description,
    appleSignIn => t.ticket.loginRequired.appleSignInDescription,
  };
}
