// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 認証機能を無効化したAuthNotifier
/// 最小限の実装のみを残しています

@ProviderFor(AuthNotifier)
const authProvider = AuthNotifierProvider._();

/// 認証機能を無効化したAuthNotifier
/// 最小限の実装のみを残しています
final class AuthNotifierProvider
    extends $StreamNotifierProvider<AuthNotifier, User?> {
  /// 認証機能を無効化したAuthNotifier
  /// 最小限の実装のみを残しています
  const AuthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
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

String _$authNotifierHash() => r'050232aef452429e9681d039f37ca3872cd1c2a1';

/// 認証機能を無効化したAuthNotifier
/// 最小限の実装のみを残しています

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
