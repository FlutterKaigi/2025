// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'user_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserNotifier)
const userProvider = UserNotifierProvider._();

final class UserNotifierProvider
    extends $AsyncNotifierProvider<UserNotifier, UserAndUserRoles> {
  const UserNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userNotifierHash();

  @$internal
  @override
  UserNotifier create() => UserNotifier();
}

String _$userNotifierHash() => r'67c8a7e50636643fe3796ac5b6c1fb73547cfffd';

abstract class _$UserNotifier extends $AsyncNotifier<UserAndUserRoles> {
  FutureOr<UserAndUserRoles> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<UserAndUserRoles>, UserAndUserRoles>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserAndUserRoles>, UserAndUserRoles>,
              AsyncValue<UserAndUserRoles>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
