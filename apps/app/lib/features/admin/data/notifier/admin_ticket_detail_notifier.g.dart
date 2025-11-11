// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'admin_ticket_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// チケット詳細を取得するProvider（管理者のみ）

@ProviderFor(adminTicketDetail)
const adminTicketDetailProvider = AdminTicketDetailFamily._();

/// チケット詳細を取得するProvider（管理者のみ）

final class AdminTicketDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<TicketItemWithUser>,
          TicketItemWithUser,
          FutureOr<TicketItemWithUser>
        >
    with
        $FutureModifier<TicketItemWithUser>,
        $FutureProvider<TicketItemWithUser> {
  /// チケット詳細を取得するProvider（管理者のみ）
  const AdminTicketDetailProvider._({
    required AdminTicketDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'adminTicketDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$adminTicketDetailHash();

  @override
  String toString() {
    return r'adminTicketDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TicketItemWithUser> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TicketItemWithUser> create(Ref ref) {
    final argument = this.argument as String;
    return adminTicketDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminTicketDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$adminTicketDetailHash() => r'7e0db1ce1a8da837aba8206dc207dab3e26ff91c';

/// チケット詳細を取得するProvider（管理者のみ）

final class AdminTicketDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TicketItemWithUser>, String> {
  const AdminTicketDetailFamily._()
    : super(
        retry: null,
        name: r'adminTicketDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// チケット詳細を取得するProvider（管理者のみ）

  AdminTicketDetailProvider call(String ticketPurchaseId) =>
      AdminTicketDetailProvider._(argument: ticketPurchaseId, from: this);

  @override
  String toString() => r'adminTicketDetailProvider';
}
