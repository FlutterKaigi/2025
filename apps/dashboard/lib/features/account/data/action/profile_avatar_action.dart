import 'dart:typed_data';

import 'package:auth_client/auth_client.dart';
import 'package:bff_client/bff_client.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:dashboard/features/account/data/service/image_utils.dart';
import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:image_picker/image_picker.dart';

/// プロフィール画像に関するアクション操作を行うクラス
class ProfileAvatarAction {
  const ProfileAvatarAction({
    required Mutation<void> uploadAvatarMutation,
    required User? user,
  }) : _uploadAvatar = uploadAvatar,
       _uploadAvatar = uploadAvatar,
       _deleteAvatar = deleteAvatar,
       _user = user;

  final Future<void> Function(Uint8List bytes) _uploadAvatar;
  final Mutation<Profiles> _updateProfileMutation;
  final Future<void> Function() _deleteAvatar;
  final Mutation<void> _updateProfileMutation;
  final User? _user;

  /// 1. PC/デバイスの画像を選択し、クロップしてアップロードする
  static final cropAndUploadMutation = Mutation<void>();
  Future<void> cropAndUploadImage(BuildContext context) async {
    final picker = ImagePicker();

    // 画像を選択
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (pickedFile == null || !context.mounted) {
      return;
    }

    final imageBytes = await pickedFile.readAsBytes();

    // クロップページに遷移
    if (!context.mounted) {
      return;
    }

    final croppedBytes = await Navigator.of(context).push<Uint8List>(
      MaterialPageRoute<Uint8List>(
        builder: (context) => _ImageCropScreen(imageBytes: imageBytes),
      ),
    );

    if (croppedBytes == null) return;

    // 400x400のWebPに変換
    final webpBytes = await ImageUtils.convertCroppedImageToWebP400(
      croppedBytes: croppedBytes,
    );

    // アップロード
    await _uploadAvatar(webpBytes);
  }

  /// 2. Google Accountの画像をそのまま利用する
  static final useGoogleAvatarMutation = Mutation<void>();
  Future<void> useGoogleAvatar() async {
    final avatarUrl = _user?.avatarUrl;
    if (avatarUrl == null) {
      throw StateError('Google Account の画像URLが取得できません');
    }

    // Google Account の画像をダウンロードして変換
    final webpBytes = await ImageUtils.convertNetworkImageToWebP400(
      imageUrl: avatarUrl,
    );

    // アップロード
    await _uploadAvatar(webpBytes);
  }

  /// 3. アバターを削除する
  static final removeAvatarMutation = Mutation<void>();
  Future<void> removeAvatar() async {
    await _deleteAvatar();
  }
}

/// 画像クロップ画面
class _ImageCropScreen extends StatefulWidget {
  const _ImageCropScreen({required this.imageBytes});

  final Uint8List imageBytes;

  @override
  State<_ImageCropScreen> createState() => _ImageCropScreenState();
}

class _ImageCropScreenState extends State<_ImageCropScreen> {
  final _cropController = CropController();
  Uint8List? _croppedBytes;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('画像をクロップ'),
        actions: [
          TextButton(
            onPressed: _croppedBytes != null
                ? () => Navigator.of(context).pop(_croppedBytes)
                : null,
            child: const Text('完了'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Crop(
                image: widget.imageBytes,
                controller: _cropController,
                onCropped: (croppedData) {
                  setState(() {
                    _croppedBytes = croppedData;
                  });
                },
                aspectRatio: 1, // 正方形
                initialSize: 0.8,
                maskColor: Colors.black.withOpacity(0.5),
                cornerDotBuilder: (size, edgeAlignment) => Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _cropController.crop,
                  icon: const Icon(Icons.crop),
                  label: const Text('クロップ'),
                ),
                ElevatedButton.icon(
                  onPressed: _cropController.reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('リセット'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
