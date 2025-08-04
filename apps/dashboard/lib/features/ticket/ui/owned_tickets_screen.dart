import 'package:dashboard/features/auth/data/notifier/auth_notifier.dart';
import 'package:dashboard/features/ticket/provider/owned_tickets_provider.dart';
import 'package:dashboard/features/ticket/ui/components/login_prompt_widget.dart';
import 'package:dashboard/features/ticket/ui/components/owned_ticket_card.dart';
import 'package:db_types/db_types.dart';
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
            onPressed: () async {
              await ref.read(ownedTicketsNotifierProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: authUser.value != null 
          ? _buildTicketsList(context, ref)
          : _buildLoginRequired(context),
    );
  }

  Widget _buildTicketsList(BuildContext context, WidgetRef ref) {
    final ownedTicketsAsync = ref.watch(ownedTicketsNotifierProvider);
    final ownedTicketsNotifier = ref.read(ownedTicketsNotifierProvider.notifier);

    return ownedTicketsAsync.when(
      data: (tickets) {
        if (tickets.isEmpty) {
          return _buildEmptyState(context);
        }

        // 購入日ごとにグループ化
        final groupedTickets = ownedTicketsNotifier.groupByPurchaseDate();
        final sortedDates = groupedTickets.keys.toList()
          ..sort((a, b) => b.compareTo(a)); // 新しい日付から表示

        return RefreshIndicator(
          onRefresh: () => ownedTicketsNotifier.refresh(),
          child: CustomScrollView(
            slivers: [
              // チケット統計情報
              SliverToBoxAdapter(
                child: _buildTicketStats(context, ref, tickets),
              ),
              
              // グループ化されたチケット一覧
              ...sortedDates.map((date) {
                final ticketsForDate = groupedTickets[date]!;
                return SliverMainAxisGroup(
                  slivers: [
                    // 日付ヘッダー
                    SliverToBoxAdapter(
                      child: _buildDateHeader(context, date, ticketsForDate.length),
                    ),
                    
                    // その日のチケット一覧
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final ticket = ticketsForDate[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            child: OwnedTicketCard(ticket: ticket),
                          );
                        },
                        childCount: ticketsForDate.length,
                      ),
                    ),
                  ],
                );
              }),
              
              // 底部の余白
              const SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _buildErrorView(context, ref, error.toString()),
    );
  }

  Widget _buildTicketStats(
    BuildContext context, 
    WidgetRef ref, 
    List<TicketPurchases> tickets,
  ) {
    final ownedTicketsNotifier = ref.read(ownedTicketsNotifierProvider.notifier);
    final latestTicket = ownedTicketsNotifier.getLatestTicket();

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.confirmation_number,
                color: Colors.white,
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '保有チケット',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${tickets.length}枚',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          if (latestTicket != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.schedule,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '最新購入: ${_formatDateTime(latestTicket.createdAt)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDateHeader(BuildContext context, DateTime date, int count) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today,
            size: 16,
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 8),
          Text(
            _formatDate(date),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$count枚',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
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
            onPressed: () async {
              await ref.read(ownedTicketsNotifierProvider.notifier).refresh();
            },
            child: const Text('再試行'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}年${date.month}月${date.day}日';
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.month}/${dateTime.day} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
