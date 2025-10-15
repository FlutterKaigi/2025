// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'image_utils.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(imageUtils)
const imageUtilsProvider = ImageUtilsProvider._();

final class ImageUtilsProvider
    extends $FunctionalProvider<ImageUtils, ImageUtils, ImageUtils>
    with $Provider<ImageUtils> {
  const ImageUtilsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageUtilsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageUtilsHash();

  @$internal
  @override
  $ProviderElement<ImageUtils> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ImageUtils create(Ref ref) {
    return imageUtils(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageUtils value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageUtils>(value),
    );
  }
}

String _$imageUtilsHash() => r'c8109b35567d7d1475ff05622dcff4c0b8dfa89c';
