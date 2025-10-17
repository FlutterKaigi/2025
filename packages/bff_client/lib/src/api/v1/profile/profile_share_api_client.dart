import 'package:bff_client/src/model/v1/profile/profile_with_sns.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_share_api_client.g.dart';

@RestApi()
abstract class ProfileShareApiClient {
  factory ProfileShareApiClient(Dio dio, {String baseUrl}) =
      _ProfileShareApiClient;

  @GET('/profile/share/me')
  Future<HttpResponse<List<ProfileWithSns>>> getMyProfileShareList();

  @GET('/profile/share/count')
  Future<HttpResponse<int>> getTotalSharedProfilesCount();

  @PUT('/profile/share/me/{profileId}')
  Future<HttpResponse<void>> putProfileShare({
    @Path('profileId') required String profileId,
  });

  @DELETE('/profile/share/me/{profileId}')
  Future<HttpResponse<void>> deleteProfileShare({
    @Path('profileId') required String profileId,
  });
}
