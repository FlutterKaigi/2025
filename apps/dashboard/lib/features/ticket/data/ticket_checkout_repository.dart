import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_checkout_repository.g.dart';

/// チケットチェックアウト関連の操作を担当するRepository
/// 
/// 将来的にチェックアウト取り消しAPIが実装された際に利用予定
@riverpod
TicketCheckoutRepository ticketCheckoutRepository(Ref ref) {
  return const TicketCheckoutRepository();
}

class TicketCheckoutRepository {
  const TicketCheckoutRepository();

  /// チェックアウト取り消し（将来実装予定）
  /// 
  /// 現在はAPIが未実装のため、UIのみ準備
  /// 
  /// [sessionId] 取り消し対象のチェックアウトセッションID
  Future<void> cancelCheckout(String sessionId) async {
    // TODO: 取り消しAPIの実装後に対応
    throw UnimplementedError('Cancel checkout API not implemented yet');
  }

  /// チェックアウト期限の確認
  /// 
  /// [expiresAt] チェックアウトの有効期限
  /// 戻り値: 期限切れの場合true
  bool isCheckoutExpired(DateTime expiresAt) {
    return DateTime.now().isAfter(expiresAt);
  }

  /// チェックアウト残り時間を計算
  /// 
  /// [expiresAt] チェックアウトの有効期限
  /// 戻り値: 残り時間（負の値の場合は期限切れ）
  Duration getTimeRemaining(DateTime expiresAt) {
    return expiresAt.difference(DateTime.now());
  }
}