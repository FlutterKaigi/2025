import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:dashboard/core/provider/bff_api_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      final client = ref.read(bffApiClientProvider);
      final response = await client.v1.profile.getMyProfile();
      state = AsyncData(response.data);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  /// プロファイル情報を更新する
  Future<void> updateProfile(ProfileUpdateRequest request) async {
    state = const AsyncLoading();
    
    try {
      final client = ref.read(bffApiClientProvider);
      await client.v1.profile.updateMyProfile(request: request);
      // 更新後に最新情報を取得
      await fetchProfile();
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  /// アバターを削除する
  Future<void> deleteAvatar() async {
    try {
      final client = ref.read(bffApiClientProvider);
      await client.v1.profile.deleteMyAvatar();
      // 削除後に最新情報を取得
      await fetchProfile();
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  /// アバターアップロード用URLを取得する
  Future<AvatarUploadUrlResponse?> getAvatarUploadUrl({
    required String fileName,
    required String contentType,
  }) async {
    try {
      final client = ref.read(bffApiClientProvider);
      final response = await client.v1.profile.getAvatarUploadUrl(
        request: AvatarUploadUrlRequest(
          fileName: fileName,
          contentType: contentType,
        ),
      );
      return response.data;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }
}

/// プロファイル編集フォームの状態管理
@riverpod
class ProfileFormNotifier extends _$ProfileFormNotifier {
  @override
  ProfileFormState build() {
    return const ProfileFormState();
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateComment(String comment) {
    state = state.copyWith(comment: comment);
  }

  void updateIsAdult(bool isAdult) {
    state = state.copyWith(isAdult: isAdult);
  }

  void updateSnsLinks(List<SnsLinkFormState> snsLinks) {
    state = state.copyWith(snsLinks: snsLinks);
  }

  void addSnsLink() {
    final newLinks = List<SnsLinkFormState>.from(state.snsLinks)
      ..add(const SnsLinkFormState());
    state = state.copyWith(snsLinks: newLinks);
  }

  void removeSnsLink(int index) {
    final newLinks = List<SnsLinkFormState>.from(state.snsLinks)
      ..removeAt(index);
    state = state.copyWith(snsLinks: newLinks);
  }

  void updateSnsLink(int index, SnsLinkFormState linkState) {
    final newLinks = List<SnsLinkFormState>.from(state.snsLinks);
    newLinks[index] = linkState;
    state = state.copyWith(snsLinks: newLinks);
  }

  void loadFromProfile(ProfileResponse profile) {
    state = ProfileFormState(
      name: profile.profile.name,
      comment: profile.profile.comment,
      isAdult: profile.profile.isAdult,
      snsLinks: profile.snsLinks
          .map((link) => SnsLinkFormState(
                snsType: link.snsType,
                value: link.value,
              ))
          .toList(),
    );
  }

  ProfileUpdateRequest toRequest() {
    return ProfileUpdateRequest(
      name: state.name.isEmpty ? null : state.name,
      comment: state.comment.isEmpty ? null : state.comment,
      isAdult: state.isAdult,
      snsLinks: state.snsLinks
          .where((link) => link.snsType != null && link.value.isNotEmpty)
          .map((link) => SnsLinkRequest(
                snsType: link.snsType!,
                value: link.value,
              ))
          .toList(),
    );
  }
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