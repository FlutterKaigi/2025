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
}
