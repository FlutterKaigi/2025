import 'package:bff_client/src/api/v1/users_api_client.dart';
import 'package:dio/dio.dart';

class BffApiClient {
  BffApiClient({required Dio dio}) : _dio = dio;

  final Dio _dio;

  BffApiClientV1 get v1 => BffApiClientV1._(dio: _dio);
}

class BffApiClientV1 {
  BffApiClientV1._({required Dio dio}) : _dio = dio;

  final Dio _dio;

  UsersApiClient get users => UsersApiClient(_dio);
}
