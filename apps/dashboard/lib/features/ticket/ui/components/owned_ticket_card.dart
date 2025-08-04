import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';

/// 保有チケットカードコンポーネント
///
/// 機能:
/// - 個々の購入済みチケット情報を表示
/// - チケットID、購入日時、ステータスを表示
/// - 美しいカードレイアウト
class OwnedTicketCard extends StatelessWidget {
  const OwnedTicketCard({
    required this.ticket,
    super.key,
  });

  final TicketPurchases ticket;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ヘッダー行（チケットID とステータス）
            Row(
              children: [
                // チケットアイコン
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _getStatusColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.confirmation_number,
                    color: _getStatusColor(),
                    size: 20,
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // チケット情報
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'チケット',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'ID: ${ticket.id.substring(0, 8)}...',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                ),
                
                // ステータスバッジ
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _getStatusText(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // チケット詳細情報
            _buildTicketDetails(context),
            
            const SizedBox(height: 12),
            
            // 購入情報
            _buildPurchaseInfo(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketDetails(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildDetailRow(
            context,
            Icons.category,
            'チケット種別',
            ticket.ticketTypeId.substring(0, 12) + '...',
          ),
          
          const SizedBox(height: 8),
          
          if (ticket.stripePaymentIntentId != null)
            _buildDetailRow(
              context,
              Icons.payment,
              '決済ID',
              ticket.stripePaymentIntentId!.substring(0, 12) + '...',
            ),
        ],
      ),
    );
  }

  Widget _buildPurchaseInfo(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.schedule,
          size: 16,
          color: Colors.grey.shade600,
        ),
        const SizedBox(width: 4),
        Text(
          '購入日時: ${_formatDateTime(ticket.createdAt)}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        
        const Spacer(),
        
        if (ticket.updatedAt != ticket.createdAt) ...[
          Icon(
            Icons.update,
            size: 16,
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 4),
          Text(
            '更新: ${_formatDateTime(ticket.updatedAt)}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey.shade600,
        ),
        const SizedBox(width: 8),
        Text(
          '$label:',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: 'monospace',
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor() {
    switch (ticket.status) {
      case TicketPurchaseStatus.completed:
        return Colors.green;
      case TicketPurchaseStatus.refunded:
        return Colors.orange;
    }
  }

  String _getStatusText() {
    switch (ticket.status) {
      case TicketPurchaseStatus.completed:
        return '購入完了';
      case TicketPurchaseStatus.refunded:
        return '返金済み';
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month}/${dateTime.day} '
        '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}