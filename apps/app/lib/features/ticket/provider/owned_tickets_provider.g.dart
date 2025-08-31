// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'owned_tickets_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// 保有チケットの状態管理
///
/// 機能:
/// - ユーザーの購入済みチケット情報を取得・表示
/// - チケット詳細情報の管理
/// - 認証が必要
@ProviderFor(ownedTickets)
const ownedTicketsProvider = OwnedTicketsProvider._();

/// 保有チケットの状態管理
///
/// 機能:
/// - ユーザーの購入済みチケット情報を取得・表示
/// - チケット詳細情報の管理
/// - 認証が必要
final class OwnedTicketsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TicketPurchases>>,
          List<TicketPurchases>,
          FutureOr<List<TicketPurchases>>
        >
    with
        $FutureModifier<List<TicketPurchases>>,
        $FutureProvider<List<TicketPurchases>> {
  /// 保有チケットの状態管理
  ///
  /// 機能:
  /// - ユーザーの購入済みチケット情報を取得・表示
  /// - チケット詳細情報の管理
  /// - 認証が必要
  const OwnedTicketsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ownedTicketsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ownedTicketsHash();

  @$internal
  @override
  $FutureProviderElement<List<TicketPurchases>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TicketPurchases>> create(Ref ref) {
    return ownedTickets(ref);
  }
}

String _$ownedTicketsHash() => r'e212cbb0864b7474525000a208a367381d2667f0';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
