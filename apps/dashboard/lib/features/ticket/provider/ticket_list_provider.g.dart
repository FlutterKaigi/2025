// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// チケット種別一覧の状態管理
///
/// 機能:
/// - 購入可能なチケット種別を取得・表示
/// - ローディング状態とエラーハンドリング
/// - 匿名ユーザーでも利用可能
@ProviderFor(ticketList)
const ticketListProvider = TicketListProvider._();

/// チケット種別一覧の状態管理
///
/// 機能:
/// - 購入可能なチケット種別を取得・表示
/// - ローディング状態とエラーハンドリング
/// - 匿名ユーザーでも利用可能
final class TicketListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TicketTypeWithOptionsItem>>,
          List<TicketTypeWithOptionsItem>,
          FutureOr<List<TicketTypeWithOptionsItem>>
        >
    with
        $FutureModifier<List<TicketTypeWithOptionsItem>>,
        $FutureProvider<List<TicketTypeWithOptionsItem>> {
  /// チケット種別一覧の状態管理
  ///
  /// 機能:
  /// - 購入可能なチケット種別を取得・表示
  /// - ローディング状態とエラーハンドリング
  /// - 匿名ユーザーでも利用可能
  const TicketListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticketListHash();

  @$internal
  @override
  $FutureProviderElement<List<TicketTypeWithOptionsItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TicketTypeWithOptionsItem>> create(Ref ref) {
    return ticketList(ref);
  }
}

String _$ticketListHash() => r'29ebc8d254361b67cf32526cdfb2a94431eed32b';

/// チケット種別一覧の状態を監視
///
/// UI側でのエラーハンドリングとローディング表示に使用
@ProviderFor(TicketListNotifier)
const ticketListNotifierProvider = TicketListNotifierProvider._();

/// チケット種別一覧の状態を監視
///
/// UI側でのエラーハンドリングとローディング表示に使用
final class TicketListNotifierProvider
    extends
        $AsyncNotifierProvider<
          TicketListNotifier,
          List<TicketTypeWithOptionsItem>
        > {
  /// チケット種別一覧の状態を監視
  ///
  /// UI側でのエラーハンドリングとローディング表示に使用
  const TicketListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketListNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticketListNotifierHash();

  @$internal
  @override
  TicketListNotifier create() => TicketListNotifier();
}

String _$ticketListNotifierHash() =>
    r'aae7568ba3de68deb01f621704c2c8eff569a682';

abstract class _$TicketListNotifier
    extends $AsyncNotifier<List<TicketTypeWithOptionsItem>> {
  FutureOr<List<TicketTypeWithOptionsItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<TicketTypeWithOptionsItem>>,
              List<TicketTypeWithOptionsItem>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<TicketTypeWithOptionsItem>>,
                List<TicketTypeWithOptionsItem>
              >,
              AsyncValue<List<TicketTypeWithOptionsItem>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
