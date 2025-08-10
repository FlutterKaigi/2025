import 'package:dashboard/features/ticket/provider/active_checkout_provider.dart';
import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// 進行中チェックアウト画面
///
/// 機能:
/// - 進行中のチェックアウト情報表示
/// - 有効期限のカウントダウン
/// - Stripe決済画面への遷移
/// - チェックアウト取り消し（将来実装）
class ActiveCheckoutScreen extends ConsumerWidget {
  const ActiveCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeCheckoutNotifier = ref.read(
      activeCheckoutNotifierProvider.notifier,
    );
    final activeCheckout = activeCheckoutNotifier.getFirstActiveCheckout();

    if (activeCheckout == null) {
      return const Center(
        child: Text('進行中のチェックアウトがありません'),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 警告アイコンとタイトル
          Row(
            children: [
              const Icon(
                Icons.pending_actions,
                color: Colors.orange,
                size: 28,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '購入手続きが進行中です',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // チェックアウト情報カード
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'チェックアウト情報',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // セッションID
                  _buildInfoRow(
                    context,
                    'セッションID',
                    activeCheckout.id,
                  ),

                  const SizedBox(height: 8),

                  // チケット種別ID（将来的には名前を表示したい）
                  _buildInfoRow(
                    context,
                    'チケット種別',
                    activeCheckout.ticketTypeId,
                  ),

                  const SizedBox(height: 16),

                  // 有効期限とカウントダウン
                  _buildExpirationInfo(context, ref, activeCheckout),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // アクションボタン
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 決済続行ボタン
              ElevatedButton.icon(
                onPressed: () =>
                    _continueToStripe(activeCheckout.stripeCheckoutUrl),
                icon: const Icon(Icons.payment),
                label: const Text('決済を続行'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),

              const SizedBox(height: 12),

              // 取り消しボタン（将来実装）
              OutlinedButton.icon(
                onPressed: () =>
                    _showCancelDialog(context, ref, activeCheckout.id),
                icon: const Icon(Icons.cancel),
                label: const Text('チェックアウトを取り消し'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 注意事項
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      '重要な注意事項',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.blue.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '• チェックアウトには有効期限があります\n'
                  '• 期限内に決済を完了してください\n'
                  '• ブラウザを閉じても進行中の状態は保持されます',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.blue.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            '$label:',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildExpirationInfo(
    BuildContext context,
    WidgetRef ref,
    TicketCheckoutSessions activeCheckout,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        final countdownAsync = ref.watch(
          checkoutCountdownNotifierProvider(activeCheckout.expiresAt),
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '有効期限:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _formatDateTime(activeCheckout.expiresAt),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),

            // カウントダウン表示
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                children: [
                  const Icon(Icons.timer, color: Colors.red),
                  const SizedBox(width: 8),
                  Text(
                    '残り時間: ${_formatDuration(countdownAsync)}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.red.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _continueToStripe(String stripeUrl) async {
    final uri = Uri.parse(stripeUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // エラーハンドリング
      throw Exception('決済画面を開けませんでした');
    }
  }

  void _showCancelDialog(
    BuildContext context,
    WidgetRef ref,
    String sessionId,
  ) => showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('チェックアウトの取り消し'),
      content: const Text('本当にチェックアウトを取り消しますか？\nこの操作は元に戻せません。'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            try {
              await ref
                  .read(activeCheckoutNotifierProvider.notifier)
                  .cancelCheckout(sessionId);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('チェックアウトを取り消しました')),
                );
              }
            } on Exception catch (error) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('取り消しに失敗しました: $error')),
                );
              }
            }
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: const Text('取り消し'),
        ),
      ],
    ),
  );

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month}/${dateTime.day} '
        '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  String _formatDuration(Duration duration) {
    if (duration.isNegative) {
      return '期限切れ';
    }

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '$hours時間$minutes分$seconds秒';
    } else if (minutes > 0) {
      return '$minutes分$seconds秒';
    } else {
      return '$seconds秒';
    }
  }
}
