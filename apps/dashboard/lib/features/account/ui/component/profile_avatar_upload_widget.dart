import 'package:dashboard/features/account/data/provider/profile_provider.dart';
import 'package:dashboard/features/account/data/service/profile_avatar_action.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';

/// プロフィール画像アップロード機能のデモWidget
class ProfileAvatarUploadWidget extends ConsumerWidget {
  const ProfileAvatarUploadWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarAction = ref.watch(profileAvatarActionProvider);
    final profile = ref.watch(profileNotifierProvider);
    
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'プロフィール画像管理',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            
            // 現在のプロフィール画像表示
            if (profile.hasValue && profile.value?.profile.avatarKey != null)
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '現在のアバター: ${profile.value!.profile.avatarKey}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              )
            else
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'アバターが設定されていません',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            
            const SizedBox(height: 24),
            
            // アクションボタン
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. 画像を選択してクロップ
                _MutationButton(
                  mutation: ProfileAvatarAction.cropAndUploadMutation,
                  onPressed: () => avatarAction.cropAndUploadImage(context),
                  icon: Icons.photo_library,
                  label: 'デバイスから画像を選択してクロップ',
                  description: '画像を選択後、正方形にクロップして400x400のWebPでアップロード',
                ),
                
                const SizedBox(height: 12),
                
                // 2. Google Account画像を使用
                _MutationButton(
                  mutation: ProfileAvatarAction.useGoogleAvatarMutation,
                  onPressed: () => avatarAction.useGoogleAvatar(),
                  icon: Icons.account_circle,
                  label: 'Google Accountの画像を使用',
                  description: 'Googleアカウントの画像をダウンロードして400x400のWebPでアップロード',
                ),
                
                const SizedBox(height: 12),
                
                // 3. アバターを削除
                _MutationButton(
                  mutation: ProfileAvatarAction.removeAvatarMutation,
                  onPressed: () => avatarAction.removeAvatar(),
                  icon: Icons.delete,
                  label: 'アバターを削除',
                  description: '現在設定されているアバターを削除',
                  isDestructive: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Mutation状態を表示するボタンWidget
class _MutationButton extends ConsumerWidget {
  const _MutationButton({
    required this.mutation,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.description,
    this.isDestructive = false,
  });

  final Mutation<void> mutation;
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final String description;
  final bool isDestructive;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mutationState = ref.watch(mutation);
    final isLoading = mutationState.isLoading;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed: isLoading ? null : () async {
            try {
              await ref.read(mutation.notifier).mutate(onPressed);
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('エラーが発生しました: $e'),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                );
              }
            }
          },
          icon: isLoading 
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Icon(icon),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: isDestructive 
                ? Theme.of(context).colorScheme.error
                : null,
            foregroundColor: isDestructive 
                ? Theme.of(context).colorScheme.onError
                : null,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        
        // エラー表示
        if (mutationState.hasError)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              'エラー: ${mutationState.error}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
          
        // 成功メッセージ
        if (mutationState.hasValue && !mutationState.isLoading)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              '完了しました',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
      ],
    );
  }
}