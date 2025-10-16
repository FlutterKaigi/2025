// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_types_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ticketTypes)
const ticketTypesProvider = TicketTypesProvider._();

final class TicketTypesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TicketTypeWithOptionsItem>>,
          List<TicketTypeWithOptionsItem>,
          FutureOr<List<TicketTypeWithOptionsItem>>
        >
    with
        $FutureModifier<List<TicketTypeWithOptionsItem>>,
        $FutureProvider<List<TicketTypeWithOptionsItem>> {
  const TicketTypesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketTypesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticketTypesHash();

  @$internal
  @override
  $FutureProviderElement<List<TicketTypeWithOptionsItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TicketTypeWithOptionsItem>> create(Ref ref) {
    return ticketTypes(ref);
  }
}

String _$ticketTypesHash() => r'dcf0289d81a46ad42d1fb0527d7ed8d186efcc37';
