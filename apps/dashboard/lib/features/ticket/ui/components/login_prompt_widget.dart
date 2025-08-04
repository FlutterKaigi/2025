import 'package:dashboard/features/auth/data/provider/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ログイン促進Widget
/// 
/// 機能:
/// - 未認証ユーザーにログインを促すUI
/// - Googleログインボタンの提供
/// - チケット購入には認証が必要であることの説明
class LoginPromptWidget extends ConsumerWidget {
  const LoginPromptWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.orange.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // アイコンとメッセージ
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.orange.shade700,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'チケット購入にはログインが必要です',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.orange.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // 説明文
            Text(
              'FlutterKaigi 2025のチケットを購入するには、Googleアカウントでのログインが必要です。',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.orange.shade700,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // ログインボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _handleLogin(context, ref),
                icon: const Icon(Icons.login),
                label: const Text('Googleアカウントでログイン'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 8),
            
            // 注意事項
            Text(
              '※ ログイン後もチケット情報は保持されます',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context, WidgetRef ref) async {
    try {
      final authService = ref.read(authServiceProvider);
      await authService.signInWithGoogle();
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ログインが完了しました')),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ログインに失敗しました: $error')),
        );
      }
    }
  }
}