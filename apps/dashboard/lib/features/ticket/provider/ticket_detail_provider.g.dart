// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// チケット種別の詳細情報状態管理
///
/// 機能:
/// - 特定のチケット種別の詳細情報を取得・表示
/// - オプション情報の管理
/// - 匿名ユーザーでも利用可能
@ProviderFor(ticketDetail)
const ticketDetailProvider = TicketDetailFamily._();

/// チケット種別の詳細情報状態管理
///
/// 機能:
/// - 特定のチケット種別の詳細情報を取得・表示
/// - オプション情報の管理
/// - 匿名ユーザーでも利用可能
final class TicketDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<TicketTypeWithOptionsResponse>,
          TicketTypeWithOptionsResponse,
          FutureOr<TicketTypeWithOptionsResponse>
        >
    with
        $FutureModifier<TicketTypeWithOptionsResponse>,
        $FutureProvider<TicketTypeWithOptionsResponse> {
  /// チケット種別の詳細情報状態管理
  ///
  /// 機能:
  /// - 特定のチケット種別の詳細情報を取得・表示
  /// - オプション情報の管理
  /// - 匿名ユーザーでも利用可能
  const TicketDetailProvider._({
    required TicketDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'ticketDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ticketDetailHash();

  @override
  String toString() {
    return r'ticketDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TicketTypeWithOptionsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TicketTypeWithOptionsResponse> create(Ref ref) {
    final argument = this.argument as String;
    return ticketDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TicketDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ticketDetailHash() => r'db02b91858526c46bce5f3435b87663270866926';

/// チケット種別の詳細情報状態管理
///
/// 機能:
/// - 特定のチケット種別の詳細情報を取得・表示
/// - オプション情報の管理
/// - 匿名ユーザーでも利用可能
final class TicketDetailFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<TicketTypeWithOptionsResponse>,
          String
        > {
  const TicketDetailFamily._()
    : super(
        retry: null,
        name: r'ticketDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// チケット種別の詳細情報状態管理
  ///
  /// 機能:
  /// - 特定のチケット種別の詳細情報を取得・表示
  /// - オプション情報の管理
  /// - 匿名ユーザーでも利用可能
  TicketDetailProvider call(String ticketTypeId) =>
      TicketDetailProvider._(argument: ticketTypeId, from: this);

  @override
  String toString() => r'ticketDetailProvider';
}

/// 選択されたオプションの状態管理
@ProviderFor(SelectedOptionsNotifier)
const selectedOptionsNotifierProvider = SelectedOptionsNotifierProvider._();

/// 選択されたオプションの状態管理
final class SelectedOptionsNotifierProvider
    extends $NotifierProvider<SelectedOptionsNotifier, Map<String, String>> {
  /// 選択されたオプションの状態管理
  const SelectedOptionsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedOptionsNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedOptionsNotifierHash();

  @$internal
  @override
  SelectedOptionsNotifier create() => SelectedOptionsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, String>>(value),
    );
  }
}

String _$selectedOptionsNotifierHash() =>
    r'fa728e579e054eee908d2d0f5d2b39705111224c';

abstract class _$SelectedOptionsNotifier
    extends $Notifier<Map<String, String>> {
  Map<String, String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Map<String, String>, Map<String, String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, String>, Map<String, String>>,
              Map<String, String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// チケット購入リクエストの生成
@ProviderFor(ticketCheckoutRequest)
const ticketCheckoutRequestProvider = TicketCheckoutRequestFamily._();

/// チケット購入リクエストの生成
final class TicketCheckoutRequestProvider
    extends
        $FunctionalProvider<
          TicketCheckoutRequest?,
          TicketCheckoutRequest?,
          TicketCheckoutRequest?
        >
    with $Provider<TicketCheckoutRequest?> {
  /// チケット購入リクエストの生成
  const TicketCheckoutRequestProvider._({
    required TicketCheckoutRequestFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'ticketCheckoutRequestProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ticketCheckoutRequestHash();

  @override
  String toString() {
    return r'ticketCheckoutRequestProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<TicketCheckoutRequest?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TicketCheckoutRequest? create(Ref ref) {
    final argument = this.argument as String;
    return ticketCheckoutRequest(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TicketCheckoutRequest? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TicketCheckoutRequest?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TicketCheckoutRequestProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ticketCheckoutRequestHash() =>
    r'b9126f7a3bfb7e4d4df6e30bf4808d39ce94010e';

/// チケット購入リクエストの生成
final class TicketCheckoutRequestFamily extends $Family
    with $FunctionalFamilyOverride<TicketCheckoutRequest?, String> {
  const TicketCheckoutRequestFamily._()
    : super(
        retry: null,
        name: r'ticketCheckoutRequestProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// チケット購入リクエストの生成
  TicketCheckoutRequestProvider call(String ticketTypeId) =>
      TicketCheckoutRequestProvider._(argument: ticketTypeId, from: this);

  @override
  String toString() => r'ticketCheckoutRequestProvider';
}

/// チケット価格計算
@ProviderFor(ticketTotalPrice)
const ticketTotalPriceProvider = TicketTotalPriceFamily._();

/// チケット価格計算
final class TicketTotalPriceProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// チケット価格計算
  const TicketTotalPriceProvider._({
    required TicketTotalPriceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'ticketTotalPriceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ticketTotalPriceHash();

  @override
  String toString() {
    return r'ticketTotalPriceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as String;
    return ticketTotalPrice(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TicketTotalPriceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ticketTotalPriceHash() => r'039caadefb7f0ce50db7440a8296e7bbf8b012ef';

/// チケット価格計算
final class TicketTotalPriceFamily extends $Family
    with $FunctionalFamilyOverride<int, String> {
  const TicketTotalPriceFamily._()
    : super(
        retry: null,
        name: r'ticketTotalPriceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// チケット価格計算
  TicketTotalPriceProvider call(String ticketTypeId) =>
      TicketTotalPriceProvider._(argument: ticketTypeId, from: this);

  @override
  String toString() => r'ticketTotalPriceProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
