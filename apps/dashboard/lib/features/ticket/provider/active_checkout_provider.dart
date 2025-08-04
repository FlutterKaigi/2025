import 'dart:async';

import 'package:dashboard/features/ticket/data/ticket_checkout_repository.dart';
import 'package:dashboard/features/ticket/data/ticket_repository.dart';
import 'package:db_types/db_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_checkout_provider.g.dart';

/// 進行中チェックアウトの状態管理
///
/// 機能:
/// - ユーザーの進行中チェックアウト情報を取得・表示
/// - チェックアウト期限の監視
/// - 認証が必要
@riverpod
Future<List<TicketCheckoutSessions>> activeCheckouts(Ref ref) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);

  try {
    final userTickets = await ticketRepository.getUserTickets();

    // 進行中（pending）のチェックアウトのみを抽出
    return userTickets.ticketCheckouts
        .where((checkout) => checkout.status == TicketCheckoutStatus.pending)
        .toList();
  } catch (error) {
    throw Exception('進行中チェックアウトの取得に失敗しました: $error');
  }
}

/// 進行中チェックアウトの監視と操作
@riverpod
class ActiveCheckoutNotifier extends _$ActiveCheckoutNotifier {
  @override
  Future<List<TicketCheckoutSessions>> build() async {
    return ref.watch(activeCheckoutsProvider.future);
  }

  /// アクティブなチェックアウトがあるかチェック
  bool hasActiveCheckout() {
    return state.when(
      data: (checkouts) => checkouts.isNotEmpty,
      loading: () => false,
      error: (_, __) => false,
    );
  }

  /// 最初のアクティブなチェックアウトを取得
  TicketCheckoutSessions? getFirstActiveCheckout() {
    return state.when(
      data: (checkouts) => checkouts.isNotEmpty ? checkouts.first : null,
      loading: () => null,
      error: (_, __) => null,
    );
  }

  /// チェックアウト期限切れチェック
  bool isCheckoutExpired(TicketCheckoutSessions checkout) {
    final checkoutRepository = ref.read(ticketCheckoutRepositoryProvider);
    return checkoutRepository.isCheckoutExpired(checkout.expiresAt);
  }

  /// チェックアウト残り時間を取得
  Duration getTimeRemaining(TicketCheckoutSessions checkout) {
    final checkoutRepository = ref.read(ticketCheckoutRepositoryProvider);
    return checkoutRepository.getTimeRemaining(checkout.expiresAt);
  }

  /// チェックアウト取り消し（将来実装予定）
  Future<void> cancelCheckout(String sessionId) async {
    try {
      // TODO: API実装後に有効化
      // final checkoutRepository = ref.read(ticketCheckoutRepositoryProvider);
      // await checkoutRepository.cancelCheckout(sessionId);

      // 暫定的にUIでの状態更新のみ
      throw UnimplementedError('チェックアウト取り消しAPIは未実装です');

      // 成功時は状態を更新
      // ref.invalidate(activeCheckoutsProvider);
      // await refresh();
    } catch (error) {
      throw Exception('チェックアウトの取り消しに失敗しました: $error');
    }
  }

  /// 進行中チェックアウト情報を手動で再取得
  Future<void> refresh() async {
    ref.invalidate(activeCheckoutsProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(activeCheckoutsProvider.future),
    );
  }
}

/// チェックアウト期限のカウントダウン用Provider
@riverpod
class CheckoutCountdownNotifier extends _$CheckoutCountdownNotifier {
  @override
  Duration build(DateTime expiresAt) {
    // 初期値として残り時間を計算
    final remaining = expiresAt.difference(DateTime.now());

    // 1秒間隔でタイマーを設定
    Timer.periodic(const Duration(seconds: 1), (timer) {
      final newRemaining = expiresAt.difference(DateTime.now());

      if (newRemaining.isNegative) {
        // 期限切れの場合はタイマーを停止
        timer.cancel();
        state = Duration.zero;
      } else {
        state = newRemaining;
      }
    });

    return remaining.isNegative ? Duration.zero : remaining;
  }

  /// カウントダウンの停止
  void stop() {
    // Riverpodでは自動的にdisposeされるため、特別な処理は不要
  }
}
