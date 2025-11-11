// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'admin_ticket_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// チケット一覧を管理するNotifier（ページネーション対応）

@ProviderFor(AdminTicketList)
const adminTicketListProvider = AdminTicketListFamily._();

/// チケット一覧を管理するNotifier（ページネーション対応）
final class AdminTicketListProvider
    extends $AsyncNotifierProvider<AdminTicketList, AdminTicketListState> {
  /// チケット一覧を管理するNotifier（ページネーション対応）
  const AdminTicketListProvider._({
    required AdminTicketListFamily super.from,
    required AdminTicketListSearchParams super.argument,
  }) : super(
         retry: null,
         name: r'adminTicketListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$adminTicketListHash();

  @override
  String toString() {
    return r'adminTicketListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AdminTicketList create() => AdminTicketList();

  @override
  bool operator ==(Object other) {
    return other is AdminTicketListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$adminTicketListHash() => r'c36e553680613cd1cd27fb90b3e6d3a997bfea07';

/// チケット一覧を管理するNotifier（ページネーション対応）

final class AdminTicketListFamily extends $Family
    with
        $ClassFamilyOverride<
          AdminTicketList,
          AsyncValue<AdminTicketListState>,
          AdminTicketListState,
          FutureOr<AdminTicketListState>,
          AdminTicketListSearchParams
        > {
  const AdminTicketListFamily._()
    : super(
        retry: null,
        name: r'adminTicketListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// チケット一覧を管理するNotifier（ページネーション対応）

  AdminTicketListProvider call(AdminTicketListSearchParams searchParams) =>
      AdminTicketListProvider._(argument: searchParams, from: this);

  @override
  String toString() => r'adminTicketListProvider';
}

/// チケット一覧を管理するNotifier（ページネーション対応）

abstract class _$AdminTicketList extends $AsyncNotifier<AdminTicketListState> {
  late final _$args = ref.$arg as AdminTicketListSearchParams;
  AdminTicketListSearchParams get searchParams => _$args;

  FutureOr<AdminTicketListState> build(
    AdminTicketListSearchParams searchParams,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<AdminTicketListState>, AdminTicketListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<AdminTicketListState>,
                AdminTicketListState
              >,
              AsyncValue<AdminTicketListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
