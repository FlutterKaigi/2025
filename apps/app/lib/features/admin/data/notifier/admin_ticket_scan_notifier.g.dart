// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'admin_ticket_scan_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// チケットスキャン用のNotifier

@ProviderFor(AdminTicketScan)
const adminTicketScanProvider = AdminTicketScanProvider._();

/// チケットスキャン用のNotifier
final class AdminTicketScanProvider
    extends $AsyncNotifierProvider<AdminTicketScan, TicketItemWithUser?> {
  /// チケットスキャン用のNotifier
  const AdminTicketScanProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adminTicketScanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adminTicketScanHash();

  @$internal
  @override
  AdminTicketScan create() => AdminTicketScan();
}

String _$adminTicketScanHash() => r'94dae53a68679447e749226031a1c8bb68f154f8';

/// チケットスキャン用のNotifier

abstract class _$AdminTicketScan extends $AsyncNotifier<TicketItemWithUser?> {
  FutureOr<TicketItemWithUser?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<TicketItemWithUser?>, TicketItemWithUser?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TicketItemWithUser?>, TicketItemWithUser?>,
              AsyncValue<TicketItemWithUser?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
