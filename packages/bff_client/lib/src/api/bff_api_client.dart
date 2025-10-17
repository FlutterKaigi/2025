import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';

export 'package:dio/dio.dart' show DioException, DioExceptionType;

class BffApiClient {
  BffApiClient({required Dio dio}) : _dio = dio;

  final Dio _dio;

  BffApiClientV1 get v1 => BffApiClientV1._(dio: _dio);
}

class BffApiClientV1 {
  BffApiClientV1._({required Dio dio}) : _dio = dio;

  final Dio _dio;

  AppVersionApiClient get appVersion => AppVersionApiClient(_dio);
  ProfileApiClient get profile => ProfileApiClient(_dio);
  SessionApiClient get session => SessionApiClient(_dio);
  SpeakerApiClient get speaker => SpeakerApiClient(_dio);
  SponsorsApiClient get sponsors => SponsorsApiClient(_dio);
  TicketsApiClient get tickets => TicketsApiClient(_dio);
  UsersApiClient get users => UsersApiClient(_dio);
  FilesApiClient get files => FilesApiClient(_dio);
}
