// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'active_checkout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// 進行中チェックアウトの状態管理
///
/// 機能:
/// - ユーザーの進行中チェックアウト情報を取得・表示
/// - チェックアウト期限の監視
/// - 認証が必要
@ProviderFor(activeCheckouts)
const activeCheckoutsProvider = ActiveCheckoutsProvider._();

/// 進行中チェックアウトの状態管理
///
/// 機能:
/// - ユーザーの進行中チェックアウト情報を取得・表示
/// - チェックアウト期限の監視
/// - 認証が必要
final class ActiveCheckoutsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TicketCheckoutSessions>>,
          List<TicketCheckoutSessions>,
          FutureOr<List<TicketCheckoutSessions>>
        >
    with
        $FutureModifier<List<TicketCheckoutSessions>>,
        $FutureProvider<List<TicketCheckoutSessions>> {
  /// 進行中チェックアウトの状態管理
  ///
  /// 機能:
  /// - ユーザーの進行中チェックアウト情報を取得・表示
  /// - チェックアウト期限の監視
  /// - 認証が必要
  const ActiveCheckoutsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeCheckoutsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeCheckoutsHash();

  @$internal
  @override
  $FutureProviderElement<List<TicketCheckoutSessions>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TicketCheckoutSessions>> create(Ref ref) {
    return activeCheckouts(ref);
  }
}

String _$activeCheckoutsHash() => r'b33ee1ee482abd688a5f51353dee17d395d7ceeb';

/// 進行中チェックアウトの監視と操作
@ProviderFor(ActiveCheckoutNotifier)
const activeCheckoutNotifierProvider = ActiveCheckoutNotifierProvider._();

/// 進行中チェックアウトの監視と操作
final class ActiveCheckoutNotifierProvider
    extends
        $AsyncNotifierProvider<
          ActiveCheckoutNotifier,
          List<TicketCheckoutSessions>
        > {
  /// 進行中チェックアウトの監視と操作
  const ActiveCheckoutNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeCheckoutNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeCheckoutNotifierHash();

  @$internal
  @override
  ActiveCheckoutNotifier create() => ActiveCheckoutNotifier();
}

String _$activeCheckoutNotifierHash() =>
    r'd86c7ebbbb1a7af35752201f9bd89e97db0a40f1';

abstract class _$ActiveCheckoutNotifier
    extends $AsyncNotifier<List<TicketCheckoutSessions>> {
  FutureOr<List<TicketCheckoutSessions>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<TicketCheckoutSessions>>,
              List<TicketCheckoutSessions>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<TicketCheckoutSessions>>,
                List<TicketCheckoutSessions>
              >,
              AsyncValue<List<TicketCheckoutSessions>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// チェックアウト期限のカウントダウン用Provider
@ProviderFor(CheckoutCountdownNotifier)
const checkoutCountdownNotifierProvider = CheckoutCountdownNotifierFamily._();

/// チェックアウト期限のカウントダウン用Provider
final class CheckoutCountdownNotifierProvider
    extends $NotifierProvider<CheckoutCountdownNotifier, Duration> {
  /// チェックアウト期限のカウントダウン用Provider
  const CheckoutCountdownNotifierProvider._({
    required CheckoutCountdownNotifierFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'checkoutCountdownNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$checkoutCountdownNotifierHash();

  @override
  String toString() {
    return r'checkoutCountdownNotifierProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CheckoutCountdownNotifier create() => CheckoutCountdownNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CheckoutCountdownNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$checkoutCountdownNotifierHash() =>
    r'04b4a37cd90e960c13610a39165a20451bcd1a91';

/// チェックアウト期限のカウントダウン用Provider
final class CheckoutCountdownNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CheckoutCountdownNotifier,
          Duration,
          Duration,
          Duration,
          DateTime
        > {
  const CheckoutCountdownNotifierFamily._()
    : super(
        retry: null,
        name: r'checkoutCountdownNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// チェックアウト期限のカウントダウン用Provider
  CheckoutCountdownNotifierProvider call(DateTime expiresAt) =>
      CheckoutCountdownNotifierProvider._(argument: expiresAt, from: this);

  @override
  String toString() => r'checkoutCountdownNotifierProvider';
}

abstract class _$CheckoutCountdownNotifier extends $Notifier<Duration> {
  late final _$args = ref.$arg as DateTime;
  DateTime get expiresAt => _$args;

  Duration build(DateTime expiresAt);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<Duration, Duration>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Duration, Duration>,
              Duration,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
