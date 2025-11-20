import 'dart:typed_data';

import 'package:app/core/gen/i18n/i18n.g.dart';
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
    useSafeArea: false,
  );

  final Uint8List imageBytes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final cropController = useRef<CropController>(CropController());
    final t = Translations.of(context);
    final isProcessing = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.account.profile.image.cropTitle),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: Crop(
                    image: imageBytes,
                    controller: cropController.value,
                    progressIndicator:
                        const CircularProgressIndicator.adaptive(),
                    withCircleUi: true,
                    onCropped: (croppedData) {
                      isProcessing.value = false;
                      switch (croppedData) {
                        case CropSuccess(:final croppedImage):
                          Navigator.of(context).pop(croppedImage);
                        case CropFailure(:final cause):
                          throw Exception(cause);
                      }
                    },
                    aspectRatio: 1,
                    onStatusChanged: (status) {
                      isProcessing.value = switch (status) {
                        CropStatus.cropping || CropStatus.loading => true,
                        _ => false,
                      };
                    },
                    cornerDotBuilder: (size, edgeAlignment) => Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.onPrimaryContainer.withValues(
                              alpha: 0.5,
                            ),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 8,
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: isProcessing.value
                              ? null
                              : () => cropController.value.undo(),
                          icon: const Icon(Icons.refresh),
                          label: Text(t.account.profile.image.reset),
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(double.infinity, 48),
                            backgroundColor: colorScheme.onErrorContainer,
                            foregroundColor: colorScheme.errorContainer,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: isProcessing.value
                              ? null
                              : () async => cropController.value.crop(),
                          icon: const Icon(Icons.crop),
                          label: Text(t.account.profile.image.crop),
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(double.infinity, 48),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (isProcessing.value)
            SizedBox.expand(
              child: ColoredBox(
                color: Colors.black.withValues(alpha: 0.5),
                child: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
