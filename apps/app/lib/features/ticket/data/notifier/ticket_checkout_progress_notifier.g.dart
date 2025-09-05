// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_checkout_progress_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(TicketCheckoutProgressNotifier)
const ticketCheckoutProgressNotifierProvider =
    TicketCheckoutProgressNotifierProvider._();

final class TicketCheckoutProgressNotifierProvider
    extends $AsyncNotifierProvider<TicketCheckoutProgressNotifier, int> {
  const TicketCheckoutProgressNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketCheckoutProgressNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticketCheckoutProgressNotifierHash();

  @$internal
  @override
  TicketCheckoutProgressNotifier create() => TicketCheckoutProgressNotifier();
}

String _$ticketCheckoutProgressNotifierHash() =>
    r'e09ef67fd33c985f9f04431288a2cacc167e3d25';

abstract class _$TicketCheckoutProgressNotifier extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
