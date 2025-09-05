import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageCropScreen extends HookConsumerWidget {
  const ImageCropScreen._({
    required this.imageBytes,
    super.key,
  });

  static Future<Uint8List?> show({
    required BuildContext context,
    required Uint8List imageBytes,
  }) async => showDialog(
    builder: (context) => ImageCropScreen._(
      imageBytes: imageBytes,
    ),
    context: context,
    fullscreenDialog: true,
  );

  final Uint8List imageBytes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final croppedBytes = useRef<Uint8List?>(null);
    final cropController = useRef<CropController>(CropController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('画像をクロップ'),
        actions: [
          TextButton(
            onPressed: croppedBytes.value != null
                ? () => Navigator.of(context).pop(croppedBytes.value)
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
                image: imageBytes,
                controller: cropController.value,
                onCropped: (croppedData) {
                  switch (croppedData) {
                    case CropSuccess(:final croppedImage):
                      Navigator.of(context).pop(croppedImage);
                    case CropFailure(:final cause):
                      throw Exception(cause);
                  }
                },
                aspectRatio: 1, // 正方形
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
                  onPressed: () async => cropController.value.crop(),
                  icon: const Icon(Icons.crop),
                  label: const Text('クロップ'),
                ),
                ElevatedButton.icon(
                  onPressed: cropController.value.undo,
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
