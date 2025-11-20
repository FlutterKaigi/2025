// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'admin_user_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdminUserNotifier)
const adminUserProvider = AdminUserNotifierFamily._();

final class AdminUserNotifierProvider
    extends $AsyncNotifierProvider<AdminUserNotifier, AdminUserState> {
  const AdminUserNotifierProvider._({
    required AdminUserNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'adminUserProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$adminUserNotifierHash();

  @override
  String toString() {
    return r'adminUserProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AdminUserNotifier create() => AdminUserNotifier();

  @override
  bool operator ==(Object other) {
    return other is AdminUserNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$adminUserNotifierHash() => r'0b3c1df2ff26d0c94befc2625a8c573e40defac5';

final class AdminUserNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          AdminUserNotifier,
          AsyncValue<AdminUserState>,
          AdminUserState,
          FutureOr<AdminUserState>,
          String
        > {
  const AdminUserNotifierFamily._()
    : super(
        retry: null,
        name: r'adminUserProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AdminUserNotifierProvider call(String userId) =>
      AdminUserNotifierProvider._(argument: userId, from: this);

  @override
  String toString() => r'adminUserProvider';
}

abstract class _$AdminUserNotifier extends $AsyncNotifier<AdminUserState> {
  late final _$args = ref.$arg as String;
  String get userId => _$args;

  FutureOr<AdminUserState> build(String userId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<AdminUserState>, AdminUserState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AdminUserState>, AdminUserState>,
              AsyncValue<AdminUserState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
