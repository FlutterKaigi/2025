import 'dart:developer';
import 'dart:typed_data';

import 'package:app/core/api/api_exception.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:app/core/provider/file_upload_dio.dart';
import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_notifier.g.dart';

@Riverpod(keepAlive: true)
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<ProfileResponse?> build() async {
    final client = ref.read(bffClientProvider);
    try {
      final response = await ApiException.transform(
        () => client.v1.profile.getMyProfile(),
      );
      return response.data;
    } on ApiErrorResponseException catch (e) {
      if (e.errorResponse.code == ErrorCode.notFound) {
        return null;
      }
      rethrow;
    }
  }

  /// プロファイル情報を更新する
  Future<Profiles> updateProfile(ProfileUpdateRequest request) async {
    final client = ref.read(bffClientProvider);
    final response = await ApiException.transform(
      () => client.v1.profile.updateMyProfile(request: request),
    );
    ref.invalidateSelf(asReload: true);
    return response.data;
  }

  /// アバターを削除する
  Future<void> deleteAvatar() async {
    final currentValue = state.value;
    if (currentValue == null) {
      throw StateError('Profile is not loaded');
    }
    final client = ref.read(bffClientProvider);
    await ApiException.transform(
      () => client.v1.profile.deleteMyAvatar(),
    );
    state = AsyncData(
      currentValue.copyWith(
        profile: currentValue.profile.copyWith(avatarUrl: null),
      ),
    );
  }

  Future<void> uploadAvatar({
    required Uint8List bytes,
  }) async {
    final client = ref.read(bffClientProvider);
    // get presigned url
    final presignedUrlResponse = await ApiException.transform(
      () => client.v1.files.getUploadUrl(
        request: FilesUploadRequest(
          variant: FileVariant.avatar,
          contentLength: bytes.length,
        ),
      ),
    );
    final preSignedUrl = presignedUrlResponse.data;
    log(preSignedUrl.toString());

    final uploadDio = ref.read(fileUploadDioProvider);
    await uploadDio.put<Map<String, dynamic>>(
      preSignedUrl.url,
      data: bytes,
      options: Options(
        contentType: 'image/png',
      ),
    );

    final currentStatus = state.value;
    final profile = await updateProfile(
      ProfileUpdateRequest(
        comment: currentStatus?.profile.comment,
        isAdult: currentStatus?.profile.isAdult,
        snsLinks: currentStatus?.snsLinks,
        name: currentStatus?.profile.name,

        avatarKey: preSignedUrl.key,
      ),
    );
    if (currentStatus != null) {
      state = AsyncData(
        currentStatus.copyWith(
          profile: profile,
          snsLinks: currentStatus.snsLinks,
        ),
      );
    }
  }
}
