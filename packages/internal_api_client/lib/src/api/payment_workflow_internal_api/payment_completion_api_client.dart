import 'package:dio/dio.dart';
import 'package:internal_api_client/src/model/container_instance_status.dart';
import 'package:internal_api_client/src/model/payment_intent.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_completion_api_client.g.dart';

@RestApi()
abstract class PaymentCompletionApiClient {
  factory PaymentCompletionApiClient(Dio dio, {String? baseUrl}) =
      _PaymentCompletionApiClient;

  /// 支払い完了ワークフローを開始します
  @PUT('/payment-completion/{userId}/{ticketCheckoutId}')
  Future<HttpResponse<ContainerInstanceStatus>> startPaymentCompletionWorkflow({
    @Path() required String userId,
    @Path() required String ticketCheckoutId,
    @Body() required PaymentIntent paymentIntent,
  });

  /// 支払い完了ワークフローのステータスを取得します
  @GET('/payment-completion/{ticketCheckoutId}')
  Future<HttpResponse<ContainerInstanceStatus>>
  getPaymentCompletionWorkflowStatus({
    @Path() required String ticketCheckoutId,
  });
}
