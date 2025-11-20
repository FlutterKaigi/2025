import 'package:app/core/api/api_exception.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:bff_client/bff_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_share_repository.g.dart';

/// プロフィールシェア関連のデータ操作を担当するRepository
///
/// bff_clientのProfileShareApiClientを使用してバックエンドAPIと通信する
@riverpod
ProfileShareRepository profileShareRepository(Ref ref) {
  final bffClient = ref.watch(bffClientProvider);
  return ProfileShareRepository._(
    profileShareApiClient: bffClient.v1.profileShare,
  );
}

class ProfileShareRepository {
  const ProfileShareRepository._({
    required ProfileShareApiClient profileShareApiClient,
  }) : _profileShareApiClient = profileShareApiClient;

  final ProfileShareApiClient _profileShareApiClient;

  /// 自分のプロフィールシェア一覧を取得
  ///
  /// 認証が必要
  Future<List<ProfileWithSns>> getMyProfileShareList() async {
    final response = await ApiException.transform(
      _profileShareApiClient.getMyProfileShareList,
    );
    return response.data;
  }

  /// プロフィールシェアを作成
  ///
  /// 認証が必要
  ///
  /// [profileId] シェアするプロフィールのユーザーID
  Future<void> putProfileShare(String profileId) async {
    await ApiException.transform(
      () => _profileShareApiClient.putProfileShare(profileId: profileId),
    );
  }

  /// プロフィールシェアを削除
  ///
  /// 認証が必要
  ///
  /// [profileId] 削除するプロフィールのユーザーID
  Future<void> deleteProfileShare(String profileId) async {
    await ApiException.transform(
      () => _profileShareApiClient.deleteProfileShare(profileId: profileId),
    );
  }

  /// 総シェア数を取得
  Future<int> getTotalSharedProfilesCount() async {
    final response = await ApiException.transform(
      _profileShareApiClient.getTotalSharedProfilesCount,
    );
    return response.data;
  }
}
