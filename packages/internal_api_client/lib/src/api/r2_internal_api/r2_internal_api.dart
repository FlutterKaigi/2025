import 'package:dio/dio.dart';
import 'package:internal_api_client/src/api/r2_internal_api/r2_api_client.dart';

class R2InternalApi {
  R2InternalApi({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  R2ApiClient get r2Api => R2ApiClient(_dio);
}
