import 'package:bff_client/bff_client.dart';
import 'package:dashboard/core/provider/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<ProfileResponse?> build() async {
    return null;
  }

  /// プロファイル情報を取得する
  Future<void> fetchProfile() async {
    state = const AsyncLoading();

    try {
      final client = ref.read(bffClientProvider);
      final response = await client.v1.profile.getMyProfile();
      state = AsyncData(response.data);
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  /// プロファイル情報を更新する
  Future<void> updateProfile(ProfileUpdateRequest request) async {
    state = const AsyncLoading();

    try {
      final client = ref.read(bffClientProvider);
      await client.v1.profile.updateMyProfile(request: request);
      // 更新後に最新情報を取得
      await fetchProfile();
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  /// アバターを削除する
  Future<void> deleteAvatar() async {
    try {
      final client = ref.read(bffClientProvider);
      await client.v1.profile.deleteMyAvatar();
      // 削除後に最新情報を取得
      await fetchProfile();
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  /// アバターアップロード用URLを取得する
  Future<FilesUploadResponse?> getAvatarUploadUrl({
    required String fileName,
    required String contentType,
  }) async {
    try {
      final client = ref.read(bffClientProvider);
      final response = await client.v1.profile.getAvatarUploadUrl(
        request: const FilesUploadRequest(
          variant: FileVariant.avatar,
        ),
      );
      return response.data;
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }
}

/// プロファイル編集フォームの状態を作成するヘルパー関数
ProfileFormState createFormStateFromProfile(ProfileResponse profile) {
  return ProfileFormState(
    name: profile.profile.name,
    comment: profile.profile.comment,
    isAdult: profile.profile.isAdult,
    snsLinks: profile.snsLinks
        .map(
          (link) => SnsLinkFormState(
            snsType: link.snsType,
            value: link.value,
          ),
        )
        .toList(),
  );
}

/// フォーム状態からAPIリクエストを作成するヘルパー関数
ProfileUpdateRequest createRequestFromFormState(ProfileFormState formState) {
  return ProfileUpdateRequest(
    name: formState.name.isEmpty ? null : formState.name,
    comment: formState.comment.isEmpty ? null : formState.comment,
    isAdult: formState.isAdult,
    snsLinks: formState.snsLinks
        .where((link) => link.snsType != null && link.value.isNotEmpty)
        .map(
          (link) => SnsLinkRequest(
            snsType: link.snsType!.name,
            value: link.value,
          ),
        )
        .toList(),
  );
}

/// プロファイル編集フォームの状態
class ProfileFormState {
  const ProfileFormState({
    this.name = '',
    this.comment = '',
    this.isAdult = false,
    this.snsLinks = const [],
  });

  final String name;
  final String comment;
  final bool isAdult;
  final List<SnsLinkFormState> snsLinks;

  ProfileFormState copyWith({
    String? name,
    String? comment,
    bool? isAdult,
    List<SnsLinkFormState>? snsLinks,
  }) {
    return ProfileFormState(
      name: name ?? this.name,
      comment: comment ?? this.comment,
      isAdult: isAdult ?? this.isAdult,
      snsLinks: snsLinks ?? this.snsLinks,
    );
  }
}

/// SNSリンクフォームの状態
class SnsLinkFormState {
  const SnsLinkFormState({
    this.snsType,
    this.value = '',
  });

  final SnsType? snsType;
  final String value;

  SnsLinkFormState copyWith({
    SnsType? snsType,
    String? value,
  }) {
    return SnsLinkFormState(
      snsType: snsType ?? this.snsType,
      value: value ?? this.value,
    );
  }
}
