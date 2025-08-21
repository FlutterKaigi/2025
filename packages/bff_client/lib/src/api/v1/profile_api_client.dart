import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api_client.g.dart';

@RestApi()
abstract class ProfileApiClient {
  factory ProfileApiClient(Dio dio, {String baseUrl}) = _ProfileApiClient;

  /// 自分のプロファイル情報を取得します
  /// Authorization Headerが必須
  @GET('/profile/me')
  Future<HttpResponse<ProfileResponse>> getMyProfile();

  /// 自分のプロファイル情報を更新します
  /// Authorization Headerが必須
  @PUT('/profile/me')
  Future<HttpResponse<Profiles>> updateMyProfile({
    @Body() required ProfileUpdateRequest request,
  });

  /// 自分のアバターを削除します
  /// Authorization Headerが必須
  @DELETE('/profile/me/avatar')
  Future<HttpResponse<void>> deleteMyAvatar();

  /// アバターアップロード用の署名付きURLを取得します
  /// Authorization Headerが必須
  @POST('/profile/me/avatar/upload-url')
  Future<HttpResponse<FileUploadResponse>> getAvatarUploadUrl({
    @Body() required FilesUploadRequest request,
  });
}
