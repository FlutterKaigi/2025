// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'admin_user_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ユーザー一覧を管理するNotifier（ページネーション対応）

@ProviderFor(AdminUserList)
const adminUserListProvider = AdminUserListFamily._();

/// ユーザー一覧を管理するNotifier（ページネーション対応）
final class AdminUserListProvider
    extends $AsyncNotifierProvider<AdminUserList, AdminUserListState> {
  /// ユーザー一覧を管理するNotifier（ページネーション対応）
  const AdminUserListProvider._({
    required AdminUserListFamily super.from,
    required AdminUserListSearchParams super.argument,
  }) : super(
         retry: null,
         name: r'adminUserListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$adminUserListHash();

  @override
  String toString() {
    return r'adminUserListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AdminUserList create() => AdminUserList();

  @override
  bool operator ==(Object other) {
    return other is AdminUserListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$adminUserListHash() => r'd18efe532addc96763ba74614702bdb1e5cd243c';

/// ユーザー一覧を管理するNotifier（ページネーション対応）

final class AdminUserListFamily extends $Family
    with
        $ClassFamilyOverride<
          AdminUserList,
          AsyncValue<AdminUserListState>,
          AdminUserListState,
          FutureOr<AdminUserListState>,
          AdminUserListSearchParams
        > {
  const AdminUserListFamily._()
    : super(
        retry: null,
        name: r'adminUserListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ユーザー一覧を管理するNotifier（ページネーション対応）

  AdminUserListProvider call(AdminUserListSearchParams searchParams) =>
      AdminUserListProvider._(argument: searchParams, from: this);

  @override
  String toString() => r'adminUserListProvider';
}

/// ユーザー一覧を管理するNotifier（ページネーション対応）

abstract class _$AdminUserList extends $AsyncNotifier<AdminUserListState> {
  late final _$args = ref.$arg as AdminUserListSearchParams;
  AdminUserListSearchParams get searchParams => _$args;

  FutureOr<AdminUserListState> build(AdminUserListSearchParams searchParams);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<AdminUserListState>, AdminUserListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AdminUserListState>, AdminUserListState>,
              AsyncValue<AdminUserListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
