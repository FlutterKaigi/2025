import 'package:dio/dio.dart';
import 'package:internal_api_client/src/api/r2_internal_api/r2_internal_api_client.dart';

class R2InternalApi {
  R2InternalApi({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  R2InternalApiClient get r2 => R2InternalApiClient(_dio);
}