// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(TicketNotifier)
const ticketNotifierProvider = TicketNotifierProvider._();

final class TicketNotifierProvider
    extends $AsyncNotifierProvider<TicketNotifier, List<TicketItem>> {
  const TicketNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticketNotifierHash();

  @$internal
  @override
  TicketNotifier create() => TicketNotifier();
}

String _$ticketNotifierHash() => r'84d4205256713222df7f20ed77887b46f7a76b4a';

abstract class _$TicketNotifier extends $AsyncNotifier<List<TicketItem>> {
  FutureOr<List<TicketItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<TicketItem>>, List<TicketItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TicketItem>>, List<TicketItem>>,
              AsyncValue<List<TicketItem>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
