// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_types_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
        isAutoDispose: false,
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

String _$ticketTypesHash() => r'a7d325d441cedf78edbed381c716bfd8686dc8a3';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
