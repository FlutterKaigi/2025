import 'package:dio/dio.dart';
import 'package:internal_api_client/src/model/id_response.dart';
import 'package:internal_api_client/src/model/payment_intent.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_completion_api_client.g.dart';

@RestApi()
abstract class PaymentCompletionApiClient {
  factory PaymentCompletionApiClient(Dio dio, {String? baseUrl}) =
      _PaymentCompletionApiClient;

  /// 支払い完了ワークフローを開始します
  @PUT(
    '/proxy/payment-workflow-internal-api/payment-completion/{userId}/{ticketCheckoutId}',
  )
  Future<HttpResponse<IdResponse>> startPaymentCompletionWorkflow({
    @Path() required String userId,
    @Path() required String ticketCheckoutId,
    @Body() required PaymentIntent paymentIntent,
  });
}
