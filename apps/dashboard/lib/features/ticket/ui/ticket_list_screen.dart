import 'package:bff_client/bff_client.dart';
import 'package:dashboard/core/router/router.dart';
import 'package:dashboard/features/ticket/provider/active_checkout_provider.dart';
import 'package:dashboard/features/ticket/provider/ticket_list_provider.dart';
import 'package:dashboard/features/ticket/ui/active_checkout_screen.dart';
import 'package:dashboard/features/ticket/ui/components/ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// チケット一覧画面
///
/// 機能:
/// - 購入可能なチケット種別を表示
/// - 進行中のチェックアウトがある場合は非表示
class TicketListScreen extends ConsumerWidget {
  const TicketListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeCheckoutAsync = ref.watch(activeCheckoutNotifierProvider);
    final ticketListAsync = ref.watch(ticketListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('チケット'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              await ref.read(ticketListNotifierProvider.notifier).refresh();
              await ref.read(activeCheckoutNotifierProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: activeCheckoutAsync.when(
        data: (checkouts) {
          // 進行中のチェックアウトがある場合は専用画面を表示
          if (checkouts.isNotEmpty) {
            return const ActiveCheckoutScreen();
          }

          // 通常のチケット一覧を表示
          return _buildTicketList(context, ref, ticketListAsync);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildErrorView(context, ref, error.toString()),
      ),
    );
  }

  Widget _buildTicketList(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<List<TicketTypeWithOptionsItem>> ticketListAsync,
  ) {
    return ticketListAsync.when(
      data: (ticketTypes) {
        if (ticketTypes.isEmpty) {
          return const Center(
            child: Text('現在販売中のチケットはありません'),
          );
        }

        return RefreshIndicator(
          onRefresh: () =>
              ref.read(ticketListNotifierProvider.notifier).refresh(),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: ticketTypes.length,
            itemBuilder: (context, index) {
              final ticketType = ticketTypes[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TicketCard(
                  ticketType: ticketType,
                  onTap: () {
                    // チケット詳細画面への遷移
                    TicketDetailRoute(ticketTypeId: ticketType.ticketType.id)
                        .go(context);
                  },
                ),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _buildErrorView(context, ref, error.toString()),
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
            onPressed: () async {
              await ref.read(ticketListNotifierProvider.notifier).refresh();
              await ref.read(activeCheckoutNotifierProvider.notifier).refresh();
            },
            child: const Text('再試行'),
          ),
        ],
      ),
    );
  }
}
