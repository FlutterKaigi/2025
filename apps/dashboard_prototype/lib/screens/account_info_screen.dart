import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../features/account/ui/component/account_circle_image.dart';
import '../features/account/ui/component/account_scaffold.dart';
import '../core/auth/auth_provider.dart';

class AccountInfoScreen extends ConsumerWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    return AccountScaffold(
          body: Column(
            children: [
              _UserInfoCard(
                authState: authState,
                onProfileEdit: () {
                  if (authState.isAnonymous) {
                    context.go('/login');
                  } else {
                    context.go('/account/profile-edit');
                  }
                },
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'その他',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text('行動規範'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('行動規範ページを開きます')),
                              );
                            },
                          ),
                          const Divider(height: 1),
                          ListTile(
                            title: const Text('プライバシーポリシー'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('プライバシーポリシーを開きます')),
                              );
                            },
                          ),
                          const Divider(height: 1),
                          ListTile(
                            title: const Text('お問い合わせ'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('お問い合わせフォームを開きます')),
                              );
                            },
                          ),
                          const Divider(height: 1),
                          ListTile(
                            title: const Text('OSSライセンス'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              showLicensePage(context: context);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (authState.isAuthenticated) ...[
                      Card(
                        child: ListTile(
                          title: const Text('ログアウト'),
                          textColor: Colors.red,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('ログアウト'),
                                content: const Text('ログアウトしますか？'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('キャンセル'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      ref.read(authProvider.notifier).signOut();
                                      context.go('/login');
                                    },
                                    child: const Text('ログアウト'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton(
                        onPressed: () {
                          context.go('/account/withdrawal');
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                        ),
                        child: const Text('退会する'),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
  }
}

class _UserInfoCard extends StatelessWidget {
  const _UserInfoCard({
    required this.authState,
    required this.onProfileEdit,
  });

  final AuthState authState;
  final VoidCallback onProfileEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      child: InkWell(
        onTap: onProfileEdit,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              const AccountCircleImage(
                imageUrl: null,
                radius: 48,
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authState.isAnonymous 
                          ? 'ゲストユーザー' 
                          : authState.userEmail ?? 'ユーザー',
                      style: theme.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      authState.isAnonymous 
                          ? 'ログインして詳細を確認'
                          : authState.userEmail ?? '',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}