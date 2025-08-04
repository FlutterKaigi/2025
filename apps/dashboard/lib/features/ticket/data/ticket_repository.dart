import 'package:bff_client/bff_client.dart';
import 'package:dashboard/core/provider/bff_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_repository.g.dart';

/// チケット関連のデータ操作を担当するRepository
///
/// bff_clientのTicketsApiClientを使用してバックエンドAPIと通信する
@riverpod
TicketRepository ticketRepository(Ref ref) {
  final bffClient = ref.watch(bffClientProvider);
  return TicketRepository(
    ticketsApiClient: bffClient.v1.tickets,
  );
}

class TicketRepository {
  const TicketRepository({
    required TicketsApiClient ticketsApiClient,
  }) : _ticketsApiClient = ticketsApiClient;

  final TicketsApiClient _ticketsApiClient;

  /// チケット種別一覧を取得（オプション情報も含む）
  ///
  /// 匿名ユーザーでも利用可能
  Future<TicketTypesWithOptionsResponse> getTicketTypes() async {
    return _ticketsApiClient.getTicketTypes();
  }

  /// 特定のチケット種別の詳細情報を取得
  ///
  /// 匿名ユーザーでも利用可能
  ///
  /// [ticketTypeId] 取得したいチケット種別のID
  Future<TicketTypeWithOptionsResponse> getTicketTypeWithOptions(
    String ticketTypeId,
  ) async {
    return _ticketsApiClient.getTicketTypeWithOptions(ticketTypeId);
  }

  /// ユーザーのチケット情報を取得（購入済み + 進行中チェックアウト）
  ///
  /// 認証が必要
  Future<UserTicketsResponse> getUserTickets() async {
    return _ticketsApiClient.getUserTickets();
  }

  /// チケットチェックアウト（枠確保）を実行
  ///
  /// 認証が必要
  /// Stripe決済用のURLを取得する
  ///
  /// [request] チェックアウト要求（チケット種別ID + オプション）
  Future<TicketCheckoutResponse> createCheckout(
    TicketCheckoutRequest request,
  ) async {
    return _ticketsApiClient.createCheckout(request);
  }

  /// チェックアウトセッションの詳細情報を取得
  ///
  /// 認証が必要
  ///
  /// [sessionId] チェックアウトセッションID
  Future<TicketCheckoutSessionResponse> getCheckoutSession(
    String sessionId,
  ) async {
    return _ticketsApiClient.getCheckoutSession(sessionId);
  }
}
