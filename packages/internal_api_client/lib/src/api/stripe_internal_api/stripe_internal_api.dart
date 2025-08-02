import 'package:dio/dio.dart';
import 'package:internal_api_client/src/api/stripe_internal_api/internal_payment_api_client.dart';

class StripeInternalApi {
  StripeInternalApi({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  InternalPaymentApiClient get internalPaymentApi =>
      InternalPaymentApiClient(_dio);
}
