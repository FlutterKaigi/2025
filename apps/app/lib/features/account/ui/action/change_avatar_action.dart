import 'dart:typed_data';

import 'package:app/core/provider/image_picker.dart';
import 'package:app/features/account/data/notifier/profile_notifier.dart';
import 'package:app/features/account/data/service/image_utils.dart';
import 'package:app/features/account/ui/action/dialog/pick_image_dialog.dart';
import 'package:app/features/account/ui/image_crop_screen.dart';
import 'package:app/features/user/data/notifier/user_notifier.dart';
import 'package:db_types/db_types.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_avatar_action.g.dart';

@Riverpod(keepAlive: true)
ChangeAvatarAction changeAvatarAction(Ref ref) => ChangeAvatarAction._(
  imagePicker: ref.watch(imagePickerProvider),
  authMetaData: ref.watch(
    userNotifierProvider.select((v) => v.value?.authMetaData),
  ),
  imageUtils: ref.watch(imageUtilsProvider),
  profileNotifier: ref.watch(profileNotifierProvider.notifier),
);

class ChangeAvatarAction {
  const ChangeAvatarAction._({
    required ImagePicker imagePicker,
    required AuthMetaData? authMetaData,
    required ImageUtils imageUtils,
    required ProfileNotifier profileNotifier,
  }) : _imagePicker = imagePicker,
       _authMetaData = authMetaData,
       _imageUtils = imageUtils,
       _profileNotifier = profileNotifier;

  final ImagePicker _imagePicker;
  final AuthMetaData? _authMetaData;
  final ImageUtils _imageUtils;
  final ProfileNotifier _profileNotifier;

  Future<void> deleteAvatar({
    required BuildContext context,
  }) async {
    await _profileNotifier.deleteAvatar();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('アバターを削除しました'),
        ),
      );
    }
  }

  /// アバターを変更する
  Future<void> changeAvatar({
    required BuildContext context,
  }) async {
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
        if (_authMetaData == null) {
          return;
        }
        final dio = Dio();
        try {
          final response = await dio.get<Uint8List>(
            _authMetaData.avatarUrl,
            options: Options(
              responseType: ResponseType.bytes,
            ),
          );
          bytes = response.data!;
        } catch (e) {
          rethrow;
        }
    }

    // crop
    if (!context.mounted) {
      return;
    }
    final croppedBytes = await ImageCropScreen.show(
      context: context,
      imageBytes: bytes,
    );
    if (croppedBytes == null) {
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
            content: Text('アバターを変更できませんでした: $e'),
          ),
        );
        return;
      }
    }

    // show snackbar
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('アバターを変更しました'),
        ),
      );
    }
  }
}
