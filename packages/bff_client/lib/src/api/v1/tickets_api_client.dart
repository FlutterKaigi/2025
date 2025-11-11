import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tickets_api_client.g.dart';

@RestApi()
abstract class TicketsApiClient {
  factory TicketsApiClient(Dio dio, {String? baseUrl}) = _TicketsApiClient;

  /// チケット種別一覧を取得（オプション情報も含む）
  @GET('/tickets/types')
  Future<TicketTypesWithOptionsResponse> getTicketTypes();

  /// チケットチェックアウト（Stripe決済開始）
  @POST('/tickets/checkout')
  Future<TicketCheckoutSessionResponse> createCheckout(
    @Body() TicketCheckoutRequest request,
  );

  /// チケットチェックアウトキャンセル
  @PUT('/tickets/checkout/{checkoutId}/cancel')
  Future<TicketCheckoutSessionResponse> cancelCheckout(
    @Path('checkoutId') String checkoutId,
  );

  /// 自分の購入済みチケット一覧を取得
  @GET('/tickets/me')
  Future<UserTicketsResponse> getUserTickets();

  /// ユーザのチケット一覧を取得
  @GET('/tickets/users/{userId}')
  Future<UserTicketsResponse> getUserTicketsByUserId(
    @Path('userId') String userId,
  );

  /// 入場履歴を追加/更新（管理者のみ）
  @PUT('/tickets/{ticketPurchaseId}/entry')
  Future<EntryLogPutResponse> putEntryLog(
    @Path('ticketPurchaseId') String ticketPurchaseId,
  );

  /// 入場履歴を削除（管理者のみ）
  @DELETE('/tickets/{ticketPurchaseId}/entry')
  Future<EntryLogDeleteResponse> deleteEntryLog(
    @Path('ticketPurchaseId') String ticketPurchaseId,
  );

  /// チケット一覧を取得（管理者のみ）
  @GET('/tickets/list')
  Future<HttpResponse<TicketsListResponse>> getTicketList({
    @Query('limit') required int limit,
    @Query('offset') int? offset,
    @Query('userId') String? userId,
    @Query('ticketTypeId') String? ticketTypeId,
    @Query('status') String? status,
    @Query('hasEntryLog') String? hasEntryLog,
  });
}
