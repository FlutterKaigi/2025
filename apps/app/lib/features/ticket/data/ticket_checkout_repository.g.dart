// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_checkout_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// チケットチェックアウト関連の操作を担当するRepository
///
/// 将来的にチェックアウト取り消しAPIが実装された際に利用予定
@ProviderFor(ticketCheckoutRepository)
const ticketCheckoutRepositoryProvider = TicketCheckoutRepositoryProvider._();

/// チケットチェックアウト関連の操作を担当するRepository
///
/// 将来的にチェックアウト取り消しAPIが実装された際に利用予定
final class TicketCheckoutRepositoryProvider
    extends
        $FunctionalProvider<
          TicketCheckoutRepository,
          TicketCheckoutRepository,
          TicketCheckoutRepository
        >
    with $Provider<TicketCheckoutRepository> {
  /// チケットチェックアウト関連の操作を担当するRepository
  ///
  /// 将来的にチェックアウト取り消しAPIが実装された際に利用予定
  const TicketCheckoutRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketCheckoutRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticketCheckoutRepositoryHash();

  @$internal
  @override
  $ProviderElement<TicketCheckoutRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TicketCheckoutRepository create(Ref ref) {
    return ticketCheckoutRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TicketCheckoutRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TicketCheckoutRepository>(value),
    );
  }
}

String _$ticketCheckoutRepositoryHash() =>
    r'4d2665d46ff7acebab2f89c83ce1d2b3ae1e9354';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
