import 'package:app/features/account/data/repository/profile_share_repository.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:bff_client/bff_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_share_notifier.g.dart';

/// プロフィールシェアの状態管理Notifier
@riverpod
class ProfileShareNotifier extends _$ProfileShareNotifier {
  @override
  Future<List<ProfileWithSns>> build() async {
    final isAnonymousOrNull = ref.watch(
      authProvider.select((v) => v.value?.isAnonymous),
    );

    // 匿名ユーザーまたは未認証の場合は空のリストを返す
    if (isAnonymousOrNull == null || isAnonymousOrNull) {
      return [];
    }

    final repository = ref.watch(profileShareRepositoryProvider);
    return repository.getMyProfileShareList();
  }

  /// プロフィールシェアを作成
  ///
  /// [profileId] シェアするプロフィールのユーザーID
  Future<void> putProfileShare(String profileId) async {
    final repository = ref.read(profileShareRepositoryProvider);
    await repository.putProfileShare(profileId);
    // シェア一覧を再取得（非同期処理後なので外部から invalidate する必要がある）
  }

  /// プロフィールシェアを削除
  ///
  /// [profileId] 削除するプロフィールのユーザーID
  Future<void> deleteProfileShare(String profileId) async {
    final repository = ref.read(profileShareRepositoryProvider);
    await repository.deleteProfileShare(profileId);
    // シェア一覧を再取得（非同期処理後なので外部から invalidate する必要がある）
  }
}
