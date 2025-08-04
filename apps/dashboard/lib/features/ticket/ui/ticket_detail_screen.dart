import 'package:bff_client/bff_client.dart';
import 'package:dashboard/features/auth/data/notifier/auth_notifier.dart';
import 'package:dashboard/features/ticket/provider/ticket_detail_provider.dart';
import 'package:dashboard/features/ticket/ui/components/login_prompt_widget.dart';
import 'package:dashboard/features/ticket/ui/components/ticket_option_selector.dart';
import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// チケット詳細画面
/// 
/// 機能:
/// - 特定のチケット種別の詳細情報を表示
/// - オプション選択
/// - 購入ボタン（認証チェック含む）
class TicketDetailScreen extends ConsumerWidget {
  const TicketDetailScreen({
    required this.ticketTypeId,
    super.key,
  });

  final String ticketTypeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketDetailAsync = ref.watch(ticketDetailProvider(ticketTypeId));
    // final selectedOptions = ref.watch(selectedOptionsNotifierProvider);
    final totalPrice = ref.watch(ticketTotalPriceProvider(ticketTypeId));
    final authUser = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('チケット詳細'),
      ),
      body: ticketDetailAsync.when(
        data: (ticketDetail) => SingleChildScrollView(
          child: Column(
            children: [
              // メイン詳細エリア
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // チケット種別情報
                    _buildTicketTypeInfo(context, ticketDetail),
                    
                    const SizedBox(height: 24),
                    
                    // オプション選択
                    if (ticketDetail.options.isNotEmpty) ...[
                      _buildOptionsSection(context, ref, ticketDetail),
                      const SizedBox(height: 24),
                    ],
                    
                    // 価格表示
                    _buildPriceInfo(context, totalPrice),
                    
                    const SizedBox(height: 32),
                  ],
                ),
              ),
              
              // 購入セクション
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: authUser.value != null
                    ? _buildPurchaseButton(context, ref)
                    : const LoginPromptWidget(),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildErrorView(context, error.toString()),
      ),
    );
  }

  Widget _buildTicketTypeInfo(BuildContext context, TicketTypeWithOptionsResponse ticketDetail) {
    final ticketType = ticketDetail.ticketType;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // タイトル
            Text(
              ticketType.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 8),
            
            // 価格
            Text(
              '¥${_formatPrice(ticketType.price)}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            // 説明文
            if (ticketType.description != null) ...[
              const SizedBox(height: 16),
              Text(
                ticketType.description!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
            
            const SizedBox(height: 16),
            
            // 販売情報
            _buildSalesInfo(context, ticketType),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesInfo(BuildContext context, TicketTypes ticketType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '販売情報',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        
        // 在庫制限
        if (ticketType.maxQuantity != null)
          _buildInfoRow(context, '販売上限', '${ticketType.maxQuantity}枚'),
        
        // 販売期間
        if (ticketType.saleStartsAt != null)
          _buildInfoRow(context, '販売開始', _formatDateTime(ticketType.saleStartsAt!)),
        
        if (ticketType.saleEndsAt != null)
          _buildInfoRow(context, '販売終了', _formatDateTime(ticketType.saleEndsAt!)),
        
        // アクティブ状態
        _buildInfoRow(
          context, 
          '販売状況', 
          ticketType.isActive ? '販売中' : '販売停止中',
        ),
      ],
    );
  }

  Widget _buildOptionsSection(BuildContext context, WidgetRef ref, TicketTypeWithOptionsResponse ticketDetail) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'オプション選択',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            ...ticketDetail.options.map<Widget>((TicketOptions option) => 
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TicketOptionSelector(
                  option: option,
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(selectedOptionsNotifierProvider.notifier)
                          .updateOption(option.id, value);
                    } else {
                      ref.read(selectedOptionsNotifierProvider.notifier)
                          .removeOption(option.id);
                    }
                  },
                ),
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceInfo(BuildContext context, int totalPrice) {
    return Card(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '合計金額',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¥${_formatPrice(totalPrice)}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPurchaseButton(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => _handlePurchase(context, ref),
        icon: const Icon(Icons.shopping_cart),
        label: const Text('購入手続きに進む'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
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
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, String error) {
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
        ],
      ),
    );
  }

  Future<void> _handlePurchase(BuildContext context, WidgetRef ref) async {
    try {
      // TODO: チェックアウト処理の実装
      // final checkoutRequest = ref.read(ticketCheckoutRequestProvider(ticketTypeId));
      // final ticketRepository = ref.read(ticketRepositoryProvider);
      // final checkoutResponse = await ticketRepository.createCheckout(checkoutRequest!);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('購入機能は実装中です')),
      );
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('エラーが発生しました: $error')),
        );
      }
    }
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month}/${dateTime.day} '
           '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
