import 'dart:async';

import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/features/admin/data/notifier/admin_ticket_scan_notifier.dart';
import 'package:app/features/admin/ui/components/admin_ticket_scan_sheet.dart';
import 'package:flutter/foundation.dart';
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
    final debugInputController = useTextEditingController();
    // QRコード検出の重複を防ぐためのフラグ
    final isProcessing = useState(false);
    final scannedIds = useRef<Set<String>>({});

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
                // 一回読み取ったものはスキップ
                if (scannedIds.value.contains(code)) {
                  continue;
                }
                scannedIds.value.add(code);
                isProcessing.value = true;
                try {
                  await _handleTicketScan(context, ref, code);
                } finally {
                  isProcessing.value = false;
                }
              }
            },
          ),
          // スキャン枠
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          // 画面下部の説明文
          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'チケットのQRコードを読み取ってください',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // デバッグモード用の入力フィールド
          if (kDebugMode)
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: debugInputController,
                        decoration: const InputDecoration(
                          labelText: 'Debug: Ticket Purchase ID',
                          hintText: 'UUID',
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () async {
                          final code = debugInputController.text.trim();
                          if (code.isNotEmpty) {
                            isProcessing.value = true;
                            try {
                              await _handleTicketScan(context, ref, code);
                            } finally {
                              isProcessing.value = false;
                            }
                          }
                        },
                        child: const Text('Debug Scan'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _handleTicketScan(
    BuildContext context,
    WidgetRef ref,
    String ticketPurchaseId,
  ) async {
    // 成功時のハプティックフィードバック
    await HapticFeedback.mediumImpact();

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
      // チケット情報を取得
      await ref
          .read(adminTicketScanProvider.notifier)
          .fetchTicketByPurchaseId(ticketPurchaseId);

      if (context.mounted) {
        Navigator.pop(context); // ローディング非表示

        final ticketAsync = ref.read(adminTicketScanProvider);
        final ticket = ticketAsync.value;

        if (ticket == null) {
          // エラー時のハプティックフィードバック
          await HapticFeedback.heavyImpact();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('チケットが見つかりませんでした'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        // チケット詳細Sheetを表示
        await AdminTicketScanSheet.show(context, ticket);

        // Sheet閉じた後、状態をリセット
        ref.read(adminTicketScanProvider.notifier).reset();
      }
    } on Exception catch (e) {
      if (context.mounted) {
        Navigator.pop(context); // ローディング非表示

        // エラー時のハプティックフィードバック
        await HapticFeedback.heavyImpact();

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
}

