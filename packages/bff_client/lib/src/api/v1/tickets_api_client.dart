import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tickets_api_client.g.dart';

@RestApi()
abstract class TicketsApiClient {
  factory TicketsApiClient(Dio dio, {String? baseUrl}) = _TicketsApiClient;

  /// チケット種別一覧を取得（オプション情報も含む）
  @GET('/v1/tickets/types')
  Future<TicketTypesWithOptionsResponse> getTicketTypes();

  /// 特定のチケット種別とオプションを取得
  @GET('/v1/tickets/types/{ticketTypeId}')
  Future<TicketTypeWithOptionsResponse> getTicketTypeWithOptions(
    @Path('ticketTypeId') String ticketTypeId,
  );

  /// チケットチェックアウト（Stripe決済開始）
  @POST('/v1/tickets/checkout')
  Future<TicketCheckoutResponse> createCheckout(
    @Body() TicketCheckoutRequest request,
  );

  /// チェックアウトセッション詳細取得
  @GET('/v1/tickets/checkout/{sessionId}')
  Future<TicketCheckoutSessionResponse> getCheckoutSession(
    @Path('sessionId') String sessionId,
  );
}
