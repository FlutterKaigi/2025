import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart' as db;
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/provider/environments_provider.dart';
import 'package:engine/provider/internal_api_client_provider.dart';
import 'package:engine/provider/minio_provider.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
import 'package:internal_api_client/internal_api_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'profile_share_api_service.g.dart';

class ProfileShareApiService {
  @Route.get('/me')
  Future<Response> _getProfileShareList(
    Request request,
  ) async => jsonResponseList(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, user, _) = userResult.unwrap;

      final database = await container.read(dbClientProvider.future);
      final profileShareList = await database.profile.share.getSharedProfiles(
        userId: user.id,
      );
      final response = await profileShareList.map(
        (e) async {
          final avatarKey = e.profile.avatarKey;
          final String? avatarUrl;
          if (avatarKey != null) {
            final environments = container.read(environmentsProvider);
            final minio = container.read(minioProvider);
            final signedUrl = await minio.presignedGetObject(
              environments.r2BucketName,
              avatarKey,
              expires: const Duration(days: 1).inSeconds,
            );
            avatarUrl = signedUrl;
          } else {
            avatarUrl = e.avatarUrl;
          }
          return ProfileWithSns(
            profile: Profiles(
              id: e.profile.id,
              name: e.profile.name,
              comment: e.profile.comment,
              isAdult: e.profile.isAdult,
              createdAt: e.profile.createdAt,
              updatedAt: e.profile.updatedAt,
              avatarUrl: avatarUrl != null ? Uri.parse(avatarUrl) : null,
            ),
            snsLinks: e.snsLinks
                .map(
                  (e) => SnsLink(
                    snsType: switch (e.snsType) {
                      db.SnsType.github => SnsType.github,
                      db.SnsType.x => SnsType.x,
                      db.SnsType.discord => SnsType.discord,
                      db.SnsType.medium => SnsType.medium,
                      db.SnsType.qiita => SnsType.qiita,
                      db.SnsType.zenn => SnsType.zenn,
                      db.SnsType.note => SnsType.note,
                      db.SnsType.other => SnsType.other,
                    },
                    value: e.value,
                  ),
                )
                .toList(),
          );
        },
      ).wait;
      return response.map((e) => e.toJson()).toList();
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

          if (user.id == profileId) {
            throw ErrorResponse.errorCode(
              code: ErrorCode.badRequest,
              detail: '自己を共有することはできません',
            );
          }

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
