// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_checkout_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(TicketCheckoutNotifier)
const ticketCheckoutNotifierProvider = TicketCheckoutNotifierProvider._();

final class TicketCheckoutNotifierProvider
    extends
        $AsyncNotifierProvider<
          TicketCheckoutNotifier,
          List<TicketCheckoutItem>
        > {
  const TicketCheckoutNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketCheckoutNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticketCheckoutNotifierHash();

  @$internal
  @override
  TicketCheckoutNotifier create() => TicketCheckoutNotifier();
}

String _$ticketCheckoutNotifierHash() =>
    r'7ba36c969df7e49ce3a26645da64f1000ca03f0c';

abstract class _$TicketCheckoutNotifier
    extends $AsyncNotifier<List<TicketCheckoutItem>> {
  FutureOr<List<TicketCheckoutItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<TicketCheckoutItem>>,
              List<TicketCheckoutItem>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<TicketCheckoutItem>>,
                List<TicketCheckoutItem>
              >,
              AsyncValue<List<TicketCheckoutItem>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
