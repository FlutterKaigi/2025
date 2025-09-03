import 'dart:typed_data';

import 'package:dashboard/core/router/router.dart';
import 'package:dashboard/features/account/data/service/image_utils.dart';
import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@Riverpod(keepAlive: true)
ProfileAvatarAction profileAvatarAction(Ref ref) => ProfileAvatarAction._(
  imageUtils: ref.watch(imageUtilsProvider),
);

class ProfileAvatarAction {
  const ProfileAvatarAction._({
    required ImageUtils imageUtils,
  }) : _imageUtils = imageUtils;

  final ImageUtils _imageUtils;

  static final cropAndUploadMutation = Mutation<void>();
  Future<Uint8List?> cropAndUploadImage(BuildContext context) async {
    final picker = ImagePicker();

    // 画像を選択
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (pickedFile == null || !context.mounted) {
      return null;
    }

    final imageBytes = await pickedFile.readAsBytes();

    // クロップページに遷移
    if (!context.mounted) {
      return null;
    }

    final croppedBytes = await ImageCropRoute(
      $extra: imageBytes,
    ).push<Uint8List?>(context);

    if (croppedBytes == null) {
      return null;
    }

    // 400x400のWebPに変換
    final pngBytes = await _imageUtils.convertToPng400(
      imageBytes: imageBytes,
    );

    return pngBytes;
  }

  /// 2. Google Accountの画像をそのまま利用する
  static final useGoogleAvatarMutation = Mutation<Uint8List>();
  Future<Uint8List> useGoogleAvatar({
    required UserAndUserRoles user,
  }) async {
    final avatarUrl = user.authMetaData.avatarUrl;

    // Google Account の画像をダウンロードして変換
    final pngBytes = await _imageUtils.convertNetworkImageToPng400(
      imageUrl: avatarUrl,
    );
    return pngBytes;
  }
}
