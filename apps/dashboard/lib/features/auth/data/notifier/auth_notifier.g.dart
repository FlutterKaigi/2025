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

  @$internal
  @override
  $StreamNotifierProviderElement<AuthNotifier, User?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamNotifierProviderElement(pointer);
}

String _$authNotifierHash() => r'5a8adc993da8b7a416be900e093b1533f5f0f33b';

abstract class _$AuthNotifier extends $StreamNotifier<User?> {
  Stream<User?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<User?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<User?>>,
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
        $FunctionalProvider<AsyncValue<AuthStateEvent>, Stream<AuthStateEvent>>
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
  String debugGetCreateSourceHash() => _$authStateChangeStreamHash();

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

String _$authStateChangeStreamHash() =>
    r'1e3091507c1ddb2585f5f27a981ca3186392932b';

<<<<<<< HEAD
=======
/// See also [_authStateChangeStream].
@ProviderFor(_authStateChangeStream)
final _authStateChangeStreamProvider = StreamProvider<AuthStateEvent>.internal(
  _authStateChangeStream,
  name: r'_authStateChangeStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangeStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef _AuthStateChangeStreamRef = StreamProviderRef<AuthStateEvent>;
String _$authNotifierHash() => r'5a8adc993da8b7a416be900e093b1533f5f0f33b';

/// See also [AuthNotifier].
@ProviderFor(AuthNotifier)
final authNotifierProvider =
    StreamNotifierProvider<AuthNotifier, User?>.internal(
      AuthNotifier.new,
      name: r'authNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AuthNotifier = StreamNotifier<User?>;
>>>>>>> 3a076a172db06becf9c680aa237e2b555521731b
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
