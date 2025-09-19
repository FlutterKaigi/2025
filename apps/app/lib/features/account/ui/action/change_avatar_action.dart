import 'dart:typed_data';

import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/provider/image_picker.dart';
import 'package:app/features/account/data/notifier/profile_notifier.dart';
import 'package:app/features/account/data/service/image_utils.dart';
import 'package:app/features/account/ui/action/dialog/pick_image_dialog.dart';
import 'package:app/features/account/ui/image_crop_screen.dart';
import 'package:app/features/user/data/notifier/user_notifier.dart';
import 'package:db_types/db_types.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_avatar_action.g.dart';

@Riverpod(keepAlive: true)
ChangeAvatarAction changeAvatarAction(Ref ref) => ChangeAvatarAction._(
  imagePicker: ref.watch(imagePickerProvider),
  userAndUserRolesFetcher: () async => ref.watch(
    userNotifierProvider.future,
  ),
  imageUtils: ref.watch(imageUtilsProvider),
  profileNotifier: ref.watch(profileNotifierProvider.notifier),
);

class ChangeAvatarAction {
  const ChangeAvatarAction._({
    required ImagePicker imagePicker,
    required Future<UserAndUserRoles> Function() userAndUserRolesFetcher,
    required ImageUtils imageUtils,
    required ProfileNotifier profileNotifier,
  }) : _imagePicker = imagePicker,
       _userAndUserRolesFetcher = userAndUserRolesFetcher,
       _imageUtils = imageUtils,
       _profileNotifier = profileNotifier;

  final ImagePicker _imagePicker;
  final Future<UserAndUserRoles> Function() _userAndUserRolesFetcher;
  final ImageUtils _imageUtils;
  final ProfileNotifier _profileNotifier;

  Future<void> deleteAvatar({
    required BuildContext context,
  }) async {
    await _profileNotifier.deleteAvatar();
    if (context.mounted) {
      final t = Translations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.account.profile.avatar.deleteSuccess),
        ),
      );
    }
  }

  /// アバターを変更する
  Future<void> changeAvatar({
    required BuildContext context,
  }) async {
    final t = Translations.of(context);
    // 写真を選ぶかGoogleアカウントの写真を使用するか選択させる
    final pickImageDialogResult = await PickImageDialog.show(context);

    if (pickImageDialogResult == null) {
      return;
    }

    late final Uint8List bytes;
    switch (pickImageDialogResult) {
      case PickImageDialogResult.imagePicker:
        final image = await _imagePicker.pickImage(source: ImageSource.gallery);
        if (image == null) {
          return;
        }
        bytes = await image.readAsBytes();
      case PickImageDialogResult.googleAccount:
        final userAndUserRoles = await _userAndUserRolesFetcher();
        final authMetaData = userAndUserRoles.authMetaData;
        final avatarUrl = authMetaData.avatarUrl;
        if (avatarUrl == null) {
          throw StateError('authMetaData.avatarUrlがnullです');
        }
        final dio = Dio();
        final response = await dio.get<Uint8List>(
          avatarUrl,
          options: Options(
            responseType: ResponseType.bytes,
          ),
        );
        bytes = response.data!;
    }

    // crop
    if (!context.mounted || bytes.isEmpty) {
      return;
    }
    final croppedBytes = await ImageCropScreen.show(
      context: context,
      imageBytes: bytes,
    );
    if (croppedBytes == null || croppedBytes.isEmpty) {
      return;
    }

    // compress
    final compressedBytes = await _imageUtils.convertToPng400(
      imageBytes: croppedBytes,
    );

    // upload
    try {
      await _profileNotifier.uploadAvatar(bytes: compressedBytes);
    } on Exception catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${t.account.profile.avatar.changeFailed}: $e'),
          ),
        );
        return;
      }
    }

    // show snackbar
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.account.profile.avatar.changeSuccess),
        ),
      );
    }
  }
}
