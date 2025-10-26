// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'minio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(minio)
const minioProvider = MinioProvider._();

final class MinioProvider extends $FunctionalProvider<Minio, Minio, Minio>
    with $Provider<Minio> {
  const MinioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'minioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$minioHash();

  @$internal
  @override
  $ProviderElement<Minio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Minio create(Ref ref) {
    return minio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Minio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Minio>(value),
    );
  }
}

String _$minioHash() => r'799da05251e6769d71e0c97a82876f6a0cde2491';
