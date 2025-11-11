import 'package:app/features/account/data/notifier/profile_notifier.dart';
import 'package:app/features/account/data/repository/profile_share_repository.dart';
import 'package:app/features/websocket/data/provider/websocket_provider.dart';
import 'package:bff_client/bff_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_share_notifier.g.dart';

/// プロフィールシェアの状態管理Notifier
@riverpod
class ProfileShareNotifier extends _$ProfileShareNotifier {
  @override
  Future<List<ProfileWithSns>> build() async {
    final hasProfile = ref.watch(
      profileProvider.select((v) => v.value != null),
    );
    if (!hasProfile) {
      throw const ProfileNotFoundException();
    }
    final repository = ref.watch(profileShareRepositoryProvider);
    ref.keepAlive();
    ref.listen(
      websocketStreamProvider,
      (_, next) async {
        if (next is AsyncError) {
          ref.invalidateSelf();
        }
        final payload = next.value;
        switch (payload) {
          case ProfileShareAddWebsocketPayload(:final profileWithSns):
            final current = await future;
            state = AsyncData([...current, profileWithSns]);
          case _:
            break;
        }
      },
    );
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
