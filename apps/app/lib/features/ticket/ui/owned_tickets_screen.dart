import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:app/features/ticket/provider/owned_tickets_provider.dart';
import 'package:app/features/ticket/ui/components/login_prompt_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 保有チケット画面
///
/// 機能:
/// - 購入済みチケット一覧を表示
/// - 購入日ごとのグループ化表示
/// - チケット詳細情報の表示
class OwnedTicketsScreen extends ConsumerWidget {
  const OwnedTicketsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('保有チケット'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async => ref.invalidate(ownedTicketsProvider),
          ),
        ],
      ),
      body: authUser.value != null
          ? _buildTicketsList(context, ref)
          : _buildLoginRequired(context),
    );
  }

  Widget _buildTicketsList(BuildContext context, WidgetRef ref) {
    final ownedTicketsAsync = ref.watch(ownedTicketsProvider);

    return ownedTicketsAsync.when(
      data: (tickets) {
        if (tickets.isEmpty) {
          return _buildEmptyState(context);
        }
        throw UnimplementedError();
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _buildErrorView(context, ref, error.toString()),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.confirmation_number_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'チケットをお持ちではありません',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'チケット一覧から購入してください',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // チケット一覧画面に戻る
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.shopping_cart),
            label: const Text('チケットを購入'),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginRequired(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: LoginPromptWidget(),
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, WidgetRef ref, String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 48,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            'エラーが発生しました',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async => ref.invalidate(ownedTicketsProvider),
            child: const Text('再試行'),
          ),
        ],
      ),
    );
  }
}
