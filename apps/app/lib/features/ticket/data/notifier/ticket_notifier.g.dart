// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TicketNotifier)
const ticketProvider = TicketNotifierProvider._();

final class TicketNotifierProvider
    extends $AsyncNotifierProvider<TicketNotifier, List<TicketItem>> {
  const TicketNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketProvider',
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

String _$ticketNotifierHash() => r'16ac712d42ff6af11108d7811155546dd09199ba';

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
