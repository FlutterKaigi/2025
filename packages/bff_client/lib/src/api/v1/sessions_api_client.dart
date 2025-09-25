import 'package:bff_client/src/model/v1/sessions/session_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'sessions_api_client.g.dart';

@RestApi()
abstract class SessionsApiClient {
  factory SessionsApiClient(Dio dio, {String baseUrl}) = _SessionsApiClient;

  @GET('/sessions')
  Future<SessionsResponse> getSessions();

  @GET('/sessions/venues')
  Future<VenuesWithSessionsResponse> getSessionsByVenue();

  @GET('/sessions/{id}')
  Future<SessionWithDetailsResponse> getSessionById(@Path() String id);

  @GET('/sessions/schedule')
  Future<SessionScheduleResponse> getSessionSchedule();

  @GET('/speakers')
  Future<SpeakersResponse> getSpeakers();

  @GET('/speakers/{id}')
  Future<SpeakerResponse> getSpeakerById(@Path() String id);
}