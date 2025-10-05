// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AuthNotifier)
const authNotifierProvider = AuthNotifierProvider._();

final class AuthNotifierProvider
    extends $StreamNotifierProvider<AuthNotifier, User?> {
  const AuthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authNotifierProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();
}

String _$authNotifierHash() => r'4695fd855698dda233e4c7e06dc0c891ca1132c6';

abstract class _$AuthNotifier extends $StreamNotifier<User?> {
  Stream<User?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<User?>, User?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<User?>, User?>,
              AsyncValue<User?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(_authStateChangeStream)
const _authStateChangeStreamProvider = _AuthStateChangeStreamProvider._();

final class _AuthStateChangeStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthStateEvent>,
          AuthStateEvent,
          Stream<AuthStateEvent>
        >
    with $FutureModifier<AuthStateEvent>, $StreamProvider<AuthStateEvent> {
  const _AuthStateChangeStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_authStateChangeStreamProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_authStateChangeStreamHash();

  @$internal
  @override
  $StreamProviderElement<AuthStateEvent> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<AuthStateEvent> create(Ref ref) {
    return _authStateChangeStream(ref);
  }
}

String _$_authStateChangeStreamHash() =>
    r'1e3091507c1ddb2585f5f27a981ca3186392932b';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
