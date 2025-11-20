import 'dart:async';

import 'package:app/core/api/api_exception.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:app/features/admin/ui/components/admin_ticket_scan_sheet.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:uuid/uuid.dart';

/// 管理者用チケットQRコードスキャン画面
class AdminTicketQrScanScreen extends HookConsumerWidget {
  const AdminTicketQrScanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isProcessing = useState(false);

    Future<void> handleTicketScan(
      String ticketPurchaseId,
    ) async {
      // 成功時のハプティックフィードバック
      unawaited(HapticFeedback.mediumImpact());

      // ローディング表示
      unawaited(
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      );

      try {
        final client = ref.read(bffClientProvider);
        final userTicketsResponse = await ApiException.transform(
          () => client.v1.tickets.getTicketByPurchaseId(ticketPurchaseId),
        );
        // チケット情報を取得
        if (context.mounted &&
            userTicketsResponse is TicketPurchaseItemWithUser) {
          Navigator.pop(context);

          await AdminTicketScanSheet.show(
            context: context,
            ticket: userTicketsResponse,
          );
        } else {
          throw Exception('チケット情報が見つかりませんでした');
        }
      } on Exception catch (e) {
        if (context.mounted) {
          Navigator.pop(context); // ローディング非表示

          // エラー時のハプティックフィードバック
          unawaited(HapticFeedback.heavyImpact());

          // エラーメッセージ表示
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('エラーが発生しました: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('チケット読み取り'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) async {
              // 処理中の場合は無視
              if (isProcessing.value) {
                return;
              }

              final barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                final code = barcode.rawValue;
                if (code == null) {
                  continue;
                }
                final isValidUuid = Uuid.isValidUUID(
                  fromString: code,
                );
                // UUID のみ通す
                if (!isValidUuid) {
                  continue;
                }
                isProcessing.value = true;
                try {
                  await handleTicketScan(code);
                } finally {
                  isProcessing.value = false;
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
