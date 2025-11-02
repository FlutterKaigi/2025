// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'profile_share_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// プロフィールシェアの状態管理Notifier

@ProviderFor(ProfileShareNotifier)
const profileShareProvider = ProfileShareNotifierProvider._();

/// プロフィールシェアの状態管理Notifier
final class ProfileShareNotifierProvider
    extends $AsyncNotifierProvider<ProfileShareNotifier, List<ProfileWithSns>> {
  /// プロフィールシェアの状態管理Notifier
  const ProfileShareNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileShareProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileShareNotifierHash();

  @$internal
  @override
  ProfileShareNotifier create() => ProfileShareNotifier();
}

String _$profileShareNotifierHash() =>
    r'd4eb609c19bd543f22e813ba9465d048de4ae578';

/// プロフィールシェアの状態管理Notifier

abstract class _$ProfileShareNotifier
    extends $AsyncNotifier<List<ProfileWithSns>> {
  FutureOr<List<ProfileWithSns>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ProfileWithSns>>, List<ProfileWithSns>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ProfileWithSns>>,
                List<ProfileWithSns>
              >,
              AsyncValue<List<ProfileWithSns>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
