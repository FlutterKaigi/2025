// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ticketItems)
const ticketItemsProvider = TicketItemsProvider._();

final class TicketItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TicketItem>>,
          List<TicketItem>,
          FutureOr<List<TicketItem>>
        >
    with $FutureModifier<List<TicketItem>>, $FutureProvider<List<TicketItem>> {
  const TicketItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticketItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<TicketItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TicketItem>> create(Ref ref) {
    return ticketItems(ref);
  }
}

String _$ticketItemsHash() => r'c9f6cf726f18b459a882234a0fbd2507bccbc2b1';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
