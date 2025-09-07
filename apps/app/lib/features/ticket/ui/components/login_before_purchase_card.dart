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

  final LoginBeforePurchaseCardType type;

  @override
  Widget build(BuildContext context) {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    type.title,
                    style: theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    type.description,
                  ),
                  FilledButton.icon(
                    label: const Text('アカウント設定'),
                    icon: const Icon(Icons.settings),
                    onPressed: () => const AccountInfoRoute().go(context),
                  ),
                ],
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
  anonymous;

  String get title => switch (this) {
    login => 'チケット購入前にGoogleアカウントでログインしてください',
    anonymous => 'チケット購入前にGoogleアカウントとリンクしてください',
  };
  String get description => 'チケットを購入するためには、Googleアカウントでログインしてください';
}
