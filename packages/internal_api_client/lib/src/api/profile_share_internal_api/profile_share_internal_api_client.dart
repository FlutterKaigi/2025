import 'package:dio/dio.dart';
import 'package:internal_api_client/src/api/profile_share_internal_api/model/profile_share_request.dart';
import 'package:internal_api_client/src/api/profile_share_internal_api/model/profile_share_response.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_share_internal_api_client.g.dart';

@RestApi()
abstract class ProfileShareInternalApiClient {
  factory ProfileShareInternalApiClient(Dio dio, {String baseUrl}) =
      _ProfileShareInternalApiClient;

  @PUT('/proxy/profile-share-internal-api/shares')
  Future<ProfileShareResponse> createProfileShare({
    @Body() required ProfileShareRequest request,
  });
}
