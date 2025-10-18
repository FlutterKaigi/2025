import 'package:bff_client/bff_client.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/provider/internal_api_client_provider.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
import 'package:internal_api_client/internal_api_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'profile_share_api_service.g.dart';

class ProfileShareApiService {
  @Route.get('/me')
  Future<Response> _getProfileShareList(Request request) async =>
      jsonResponseList(
        () async {
          final supabaseUtil = container.read(supabaseUtilProvider);
          final userResult = await supabaseUtil.extractUser(request);
          final (_, user, _) = userResult.unwrap;

          final database = await container.read(dbClientProvider.future);
          final profileShareList = await database.profile.share
              .getSharedProfiles(
                userId: user.id,
              );
          return profileShareList.map((p) => p.toJson()).toList();
        },
      );

  @Route.get('/count')
  Future<Response> _getTotalSharedProfilesCount(Request request) async =>
      jsonResponse(
        () async {
          final database = await container.read(dbClientProvider.future);
          final totalSharedProfilesCount = await database.profile.share
              .getTotalSharedProfilesCount();
          return ProfileShareCountResponse(
            count: totalSharedProfilesCount,
          ).toJson();
        },
      );

  @Route.put('/me/<profileId>')
  Future<Response> _putProfileShare(Request request, String profileId) async =>
      jsonResponse(
        () async {
          final supabaseUtil = container.read(supabaseUtilProvider);
          final userResult = await supabaseUtil.extractUser(request);
          final (_, user, _) = userResult.unwrap;

          final internalApiClient = container.read(internalApiClientProvider);
          final profileShareResponse = await internalApiClient
              .profileShareInternalApi
              .createProfileShare(
                request: ProfileShareRequest(
                  profileId: user.id,
                  anotherProfileId: profileId,
                ),
              );
          return ProfileShareResponse(
            message: profileShareResponse.message,
          ).toJson();
        },
      );

  @Route.delete('/me/{profileId}')
  Future<Response> _deleteProfileShare(Request request) async => jsonResponse(
    () async {
      throw ErrorResponse.errorCode(code: ErrorCode.notImplemented);
    },
  );

  Router get router => _$ProfileShareApiServiceRouter(this);
}
