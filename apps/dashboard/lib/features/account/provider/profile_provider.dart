import 'dart:developer';
import 'dart:typed_data';

import 'package:bff_client/bff_client.dart';
import 'package:dashboard/core/provider/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<ProfileResponse?> build() async {
    final client = ref.read(bffClientProvider);
    final response = await client.v1.profile.getMyProfile();
    return response.data;
  }

  /// プロファイル情報を更新する
  static final updateProfileMutation = Mutation<Profiles>();
  Future<Profiles> updateProfile(ProfileUpdateRequest request) async {
    final currentValue = state.value;
    if (currentValue == null) {
      throw StateError('Profile is not loaded');
    }
    final client = ref.read(bffClientProvider);
    final response = await client.v1.profile.updateMyProfile(request: request);
    final data = response.data;
    state = AsyncData(currentValue.copyWith(profile: data));
    return data;
  }

  /// アバターを削除する
  static final deleteAvatarMutation = Mutation<void>();
  Future<void> deleteAvatar() async {
    final currentValue = state.value;
    if (currentValue == null) {
      throw StateError('Profile is not loaded');
    }
    final client = ref.read(bffClientProvider);
    await client.v1.profile.deleteMyAvatar();
    state = AsyncData(
      currentValue.copyWith(
        profile: currentValue.profile.copyWith(avatarKey: null),
      ),
    );
  }

  static final uploadAvatarMutation = Mutation<void>();
  Future<void> uploadAvatar({
    required Uint8List bytes,
  }) async {
    final client = ref.read(bffClientProvider);
    // get presigned url
    final presignedUrlResponse = await client.v1.profile.getAvatarUploadUrl(
      request: FilesUploadRequest(
        variant: FileVariant.avatar,
        contentLength: bytes.length,
      ),
    );
    final preSignedUrl = presignedUrlResponse.data;
    log(preSignedUrl.toString());

    
  }
}
