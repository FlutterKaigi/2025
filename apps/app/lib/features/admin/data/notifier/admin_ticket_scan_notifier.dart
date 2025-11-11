import 'package:app/core/api/api_exception.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:bff_client/bff_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_ticket_scan_notifier.g.dart';

/// チケットスキャン用のNotifier
@riverpod
class AdminTicketScan extends _$AdminTicketScan {
  @override
  FutureOr<TicketItemWithUser?> build() => null;

  /// チケット購入IDからチケット情報を取得
  Future<void> fetchTicketByPurchaseId(String ticketPurchaseId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final client = ref.read(bffClientProvider);
      return ApiException.transform(
        () => client.v1.tickets.getTicketByPurchaseId(ticketPurchaseId),
      );
    });
  }

  /// 状態をリセット
  void reset() {
    state = const AsyncData(null);
  }
}
