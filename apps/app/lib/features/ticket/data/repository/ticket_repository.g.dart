// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

String _$ticketRepositoryHash() => r'636aeb183427cdbe7d620e43e8d39d754af0f9ed';
