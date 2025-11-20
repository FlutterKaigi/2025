// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'profile_share_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// プロフィールシェア関連のデータ操作を担当するRepository
///
/// bff_clientのProfileShareApiClientを使用してバックエンドAPIと通信する

@ProviderFor(profileShareRepository)
const profileShareRepositoryProvider = ProfileShareRepositoryProvider._();

/// プロフィールシェア関連のデータ操作を担当するRepository
///
/// bff_clientのProfileShareApiClientを使用してバックエンドAPIと通信する

final class ProfileShareRepositoryProvider
    extends
        $FunctionalProvider<
          ProfileShareRepository,
          ProfileShareRepository,
          ProfileShareRepository
        >
    with $Provider<ProfileShareRepository> {
  /// プロフィールシェア関連のデータ操作を担当するRepository
  ///
  /// bff_clientのProfileShareApiClientを使用してバックエンドAPIと通信する
  const ProfileShareRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileShareRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileShareRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProfileShareRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProfileShareRepository create(Ref ref) {
    return profileShareRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileShareRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileShareRepository>(value),
    );
  }
}

String _$profileShareRepositoryHash() =>
    r'1caad2a040997e8c37b64daf5bc6d14a4408a4a9';
