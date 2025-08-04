import 'package:bff_client/bff_client.dart';
import 'package:dashboard/features/ticket/data/ticket_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_list_provider.g.dart';

/// チケット種別一覧の状態管理
/// 
/// 機能:
/// - 購入可能なチケット種別を取得・表示
/// - ローディング状態とエラーハンドリング
/// - 匿名ユーザーでも利用可能
@riverpod
Future<List<TicketTypeWithOptionsItem>> ticketList(Ref ref) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  
  try {
    final response = await ticketRepository.getTicketTypes();
    return response.ticketTypes;
  } catch (error) {
    // エラーログ出力（将来的にはtalkerなどのロガーを使用）
    throw Exception('チケット一覧の取得に失敗しました: $error');
  }
}

/// チケット種別一覧の状態を監視
/// 
/// UI側でのエラーハンドリングとローディング表示に使用
@riverpod
class TicketListNotifier extends _$TicketListNotifier {
  @override
  Future<List<TicketTypeWithOptionsItem>> build() async {
    return ref.watch(ticketListProvider.future);
  }

  /// チケット一覧を手動で再取得
  Future<void> refresh() async {
    // プロバイダーを無効化して再取得
    ref.invalidate(ticketListProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(ticketListProvider.future));
  }

  /// 特定のチケット種別がアクティブかチェック
  bool isTicketTypeActive(TicketTypeWithOptionsItem item) {
    final now = DateTime.now();
    final ticketType = item.ticketType;
    
    // 基本的なアクティブ判定
    if (!ticketType.isActive) return false;
    
    // 販売開始日のチェック
    if (ticketType.saleStartsAt != null && 
        now.isBefore(ticketType.saleStartsAt!)) {
      return false;
    }
    
    // 販売終了日のチェック  
    if (ticketType.saleEndsAt != null && 
        now.isAfter(ticketType.saleEndsAt!)) {
      return false;
    }
    
    return true;
  }

  /// チケット種別の販売状況メッセージを取得
  String getSalesStatusMessage(TicketTypeWithOptionsItem item) {
    if (!isTicketTypeActive(item)) {
      final now = DateTime.now();
      final ticketType = item.ticketType;
      
      if (!ticketType.isActive) {
        return '販売停止中';
      }
      
      if (ticketType.saleStartsAt != null && 
          now.isBefore(ticketType.saleStartsAt!)) {
        return '販売開始前';
      }
      
      if (ticketType.saleEndsAt != null && 
          now.isAfter(ticketType.saleEndsAt!)) {
        return '販売終了';
      }
    }
    
    return '販売中';
  }
}