import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'job_boards_api_client.g.dart';

@RestApi()
abstract class JobBoardsApiClient {
  factory JobBoardsApiClient(Dio dio, {String baseUrl}) = _JobBoardsApiClient;

  @GET('/job-boards')
  Future<List<JobBoard>> getAllJobBoards();
}
