import 'package:app/core/api/api_exception.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:bff_client/bff_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_ticket_detail_notifier.g.dart';

/// チケット詳細を取得するProvider（管理者のみ）
@riverpod
Future<TicketItemWithUser> adminTicketDetail(
  Ref ref,
  String ticketPurchaseId,
) async {
  final client = ref.watch(bffClientProvider);
  return ApiException.transform(
    () => client.v1.tickets.getTicketByPurchaseId(ticketPurchaseId),
  );
}
