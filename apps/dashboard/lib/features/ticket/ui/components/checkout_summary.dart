import 'package:bff_client/bff_client.dart';
import 'package:dashboard/features/auth/data/notifier/auth_notifier.dart';
import 'package:dashboard/features/ticket/data/ticket_repository.dart';
import 'package:dashboard/features/ticket/provider/ticket_detail_provider.dart';
import 'package:dashboard/features/ticket/ui/components/login_prompt_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// チケット購入確認Sheet
///
/// 機能:
/// - 選択したオプションと合計金額の確認
/// - 認証チェック
/// - 枠確保（チェックアウト）の実行
/// - Stripe決済画面への遷移
class CheckoutSummarySheet extends ConsumerStatefulWidget {
  const CheckoutSummarySheet({
    required this.ticketTypeId,
    required this.ticketDetail,
    super.key,
  });

  final String ticketTypeId;
  final TicketTypeWithOptionsResponse ticketDetail;

  @override
  ConsumerState<CheckoutSummarySheet> createState() =>
      _CheckoutSummarySheetState();
}

class _CheckoutSummarySheetState extends ConsumerState<CheckoutSummarySheet> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final selectedOptions = ref.watch(selectedOptionsNotifierProvider);
    final totalPrice = ref.watch(ticketTotalPriceProvider(widget.ticketTypeId));
    final authUser = ref.watch(authNotifierProvider);
    final checkoutRequest = ref.watch(
      ticketCheckoutRequestProvider(widget.ticketTypeId),
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ヘッダー
          Row(
            children: [
              const Icon(Icons.shopping_cart_outlined, size: 28),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'チケット購入確認',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // チケット情報
          _buildTicketInfo(context),

          const SizedBox(height: 16),

          // 選択したオプション
          if (selectedOptions.isNotEmpty) ...[
            _buildSelectedOptions(context, selectedOptions),
            const SizedBox(height: 16),
          ],

          // 合計金額
          _buildPriceSection(context, totalPrice),

          const SizedBox(height: 24),

          // 購入ボタンまたはログイン促進
          if (authUser.value != null)
            _buildCheckoutButton(context, checkoutRequest)
          else
            const LoginPromptWidget(),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTicketInfo(BuildContext context) {
    final ticketType = widget.ticketDetail.ticketType;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ticketType.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            if (ticketType.description != null)
              Text(
                ticketType.description!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedOptions(
    BuildContext context,
    Map<String, String> selectedOptions,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '選択したオプション',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...selectedOptions.entries.map((entry) {
              // オプション名を取得
              final option = widget.ticketDetail.options.firstWhere(
                (opt) => opt.id == entry.key,
              );
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        option.name,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Text(
                      _formatOptionValue(entry.value),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceSection(BuildContext context, int totalPrice) {
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

  Widget _buildCheckoutButton(
    BuildContext context,
    TicketCheckoutRequest? checkoutRequest,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed: _isProcessing || checkoutRequest == null
              ? null
              : () => _handleCheckout(context, checkoutRequest),
          icon: _isProcessing
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.payment),
          label: Text(_isProcessing ? '処理中...' : 'チケットを購入する'),
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
        const SizedBox(height: 8),
        Text(
          '※ 決済画面（Stripe）に移動します',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Future<void> _handleCheckout(
    BuildContext context,
    TicketCheckoutRequest checkoutRequest,
  ) async {
    setState(() {
      _isProcessing = true;
    });

    try {
      final ticketRepository = ref.read(ticketRepositoryProvider);
      final checkoutResponse = await ticketRepository.createCheckout(
        checkoutRequest,
      );

      if (context.mounted) {
        // 成功時はSheetを閉じる
        Navigator.of(context).pop();

        // Stripe決済画面に遷移
        await _openStripeCheckout(checkoutResponse.stripeCheckoutUrl);

        // スナックバーで成功メッセージを表示
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('決済画面に移動しました。決済を完了してください。'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('チェックアウトに失敗しました: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  Future<void> _openStripeCheckout(String stripeUrl) async {
    final uri = Uri.parse(stripeUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('決済画面を開けませんでした');
    }
  }

  String _formatOptionValue(String value) {
    switch (value.toLowerCase()) {
      case 'yes':
        return '参加する';
      case 'no':
        return '参加しない';
      case 'normal':
        return '通常食';
      case 'vegetarian':
        return 'ベジタリアン';
      case 'vegan':
        return 'ビーガン';
      case 'halal':
        return 'ハラル';
      default:
        return value;
    }
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
  }
}

/// CheckoutSummarySheetを表示するヘルパー関数
Future<void> showCheckoutSummarySheet(
  BuildContext context, {
  required String ticketTypeId,
  required TicketTypeWithOptionsResponse ticketDetail,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: CheckoutSummarySheet(
        ticketTypeId: ticketTypeId,
        ticketDetail: ticketDetail,
      ),
    ),
  );
}
