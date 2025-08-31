// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// チケット関連のデータ操作を担当するRepository
///
/// bff_clientのTicketsApiClientを使用してバックエンドAPIと通信する
@ProviderFor(ticketRepository)
const ticketRepositoryProvider = TicketRepositoryProvider._();

/// チケット関連のデータ操作を担当するRepository
///
/// bff_clientのTicketsApiClientを使用してバックエンドAPIと通信する
final class TicketRepositoryProvider
    extends
        $FunctionalProvider<
          TicketRepository,
          TicketRepository,
          TicketRepository
        >
    with $Provider<TicketRepository> {
  /// チケット関連のデータ操作を担当するRepository
  ///
  /// bff_clientのTicketsApiClientを使用してバックエンドAPIと通信する
  const TicketRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticketRepositoryHash();

  @$internal
  @override
  $ProviderElement<TicketRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TicketRepository create(Ref ref) {
    return ticketRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TicketRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TicketRepository>(value),
    );
  }
}

String _$ticketRepositoryHash() => r'167b06f1fb2c288944eca3750b593838f1a86a51';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
