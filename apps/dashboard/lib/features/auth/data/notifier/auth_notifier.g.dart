// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateChangeStreamHash() =>
    r'1e3091507c1ddb2585f5f27a981ca3186392932b';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
