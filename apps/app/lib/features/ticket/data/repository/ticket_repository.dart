import 'package:app/core/provider/bff_client.dart';
import 'package:bff_client/bff_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_repository.g.dart';

/// チケット関連のデータ操作を担当するRepository
///
/// bff_clientのTicketsApiClientを使用してバックエンドAPIと通信する
@riverpod
TicketRepository ticketRepository(Ref ref) {
  final bffClient = ref.watch(bffClientProvider);
  return TicketRepository._(
    ticketsApiClient: bffClient.v1.tickets,
  );
}

class TicketRepository {
  const TicketRepository._({
    required TicketsApiClient ticketsApiClient,
  }) : _ticketsApiClient = ticketsApiClient;

  final TicketsApiClient _ticketsApiClient;

  /// チケット種別一覧を取得（オプション情報も含む）
  ///
  /// 匿名ユーザーでも利用可能
  Future<TicketTypesWithOptionsResponse> getTicketTypes() async =>
      _ticketsApiClient.getTicketTypes();

  /// ユーザーのチケット情報を取得（購入済み + 進行中チェックアウト）
  ///
  /// 認証が必要
  Future<List<TicketItem>> getUserTickets() async {
    final response = await _ticketsApiClient.getUserTickets();
    return response.tickets;
  }

  /// チケットチェックアウト（枠確保）を実行
  ///
  /// 認証が必要
  /// Stripe決済用のURLを取得する
  ///
  /// [request] チェックアウト要求（チケット種別ID + オプション）
  Future<TicketCheckoutSessionResponse> createCheckout(
    TicketCheckoutRequest request,
  ) async => _ticketsApiClient.createCheckout(request);

  /// チケットチェックアウトキャンセル
  ///
  /// 認証が必要
  ///
  /// [checkoutId] チェックアウトセッションID
  Future<TicketCheckoutSessionResponse> cancelCheckout(
    String checkoutId,
  ) async => _ticketsApiClient.cancelCheckout(checkoutId);
}
