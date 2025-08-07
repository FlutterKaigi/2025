import 'package:bff_client/bff_client.dart';
import 'package:dashboard/features/ticket/provider/ticket_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// チケット種別を表示するカードコンポーネント
///
/// 機能:
/// - チケット名、価格、販売状況を表示
/// - 販売期間とアクティブ状態の視覚的表示
/// - タップ時のコールバック処理
class TicketCard extends ConsumerWidget {
  const TicketCard({
    required this.ticketType,
    required this.onTap,
    super.key,
  });

  final TicketTypeWithOptionsItem ticketType;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketListNotifier = ref.read(ticketListNotifierProvider.notifier);
    final isActive = ticketListNotifier.isTicketTypeActive(ticketType);
    final statusMessage = ticketListNotifier.getSalesStatusMessage(ticketType);

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: isActive ? onTap : null,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ヘッダー行（チケット名と価格）
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      ticketType.ticketType.name,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: isActive ? null : Colors.grey,
                          ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '¥${_formatPrice(ticketType.ticketType.price)}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: isActive
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // 販売状況バッジ
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(isActive),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      statusMessage,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // 在庫制限表示
                  if (ticketType.ticketType.maxQuantity != null) ...[
                    const SizedBox(width: 8),
                    Text(
                      '限定${ticketType.ticketType.maxQuantity}枚',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),

              // 説明文（ある場合）
              if (ticketType.ticketType.description != null) ...[
                const SizedBox(height: 12),
                Text(
                  ticketType.ticketType.description!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isActive ? null : Colors.grey,
                  ),
                ),
              ],

              // オプション情報（ある場合）
              if (ticketType.options.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  'オプション${ticketType.options.length}種類あり',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],

              // 販売期間情報
              if (ticketType.ticketType.saleStartsAt != null ||
                  ticketType.ticketType.saleEndsAt != null) ...[
                const SizedBox(height: 8),
                _buildSalesperiodInfo(context),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSalesperiodInfo(BuildContext context) {
    final startDate = ticketType.ticketType.saleStartsAt;
    final endDate = ticketType.ticketType.saleEndsAt;

    var periodText = '';
    if (startDate != null && endDate != null) {
      periodText =
          '販売期間: ${_formatDateTime(startDate)} - ${_formatDateTime(endDate)}';
    } else if (startDate != null) {
      periodText = '販売開始: ${_formatDateTime(startDate)}';
    } else if (endDate != null) {
      periodText = '販売終了: ${_formatDateTime(endDate)}';
    }

    return Text(
      periodText,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Colors.grey[600],
      ),
    );
  }

  Color _getStatusColor(bool isActive) {
    return isActive ? Colors.green : Colors.grey;
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.month}/${dateTime.day} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
