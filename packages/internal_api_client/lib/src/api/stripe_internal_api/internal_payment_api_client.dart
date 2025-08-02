import 'package:dio/dio.dart';
import 'package:internal_api_client/src/api/stripe_internal_api/model/put_checkout_session_response.dart';
import 'package:internal_api_client/src/api/stripe_internal_api/model/put_checkout_sesson_request.dart';
import 'package:retrofit/retrofit.dart';

part 'internal_payment_api_client.g.dart';

@RestApi()
abstract class InternalPaymentApiClient {
  factory InternalPaymentApiClient(Dio dio, {String baseUrl}) =
      _InternalPaymentApiClient;

  @PUT('/stripe/checkout-session')
  Future<HttpResponse<PutCheckoutSessionResponse>> createCheckoutSession({
    @Body() required PutCheckoutSessonRequest request,
  });
}
