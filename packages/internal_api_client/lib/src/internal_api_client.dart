import 'package:dio/dio.dart';
import 'package:internal_api_client/src/api/payment_workflow_internal_api/payment_workflow_internal_api.dart';
import 'package:internal_api_client/src/api/profile_share_internal_api/profile_share_internal_api_client.dart';
import 'package:internal_api_client/src/api/r2_internal_api/r2_internal_api.dart';
import 'package:internal_api_client/src/api/stripe_internal_api/stripe_internal_api.dart';

/// Payment Workflow Internal APIクライアント
class InternalApiClient {
  InternalApiClient({required Dio dio}) : _dio = dio;

  final Dio _dio;

  PaymentWorkflowInternalApi get paymentWorkflowInternalApi =>
      PaymentWorkflowInternalApi(dio: _dio);

  R2InternalApi get r2InternalApi => R2InternalApi(dio: _dio);

  StripeInternalApi get stripeInternalApi => StripeInternalApi(dio: _dio);

  ProfileShareInternalApiClient get profileShareInternalApi =>
      ProfileShareInternalApiClient(_dio);
}
