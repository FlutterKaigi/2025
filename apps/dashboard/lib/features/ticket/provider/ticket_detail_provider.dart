import 'package:bff_client/bff_client.dart';
import 'package:dashboard/features/ticket/data/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_detail_provider.g.dart';

/// チケット種別の詳細情報状態管理
///
/// 機能:
/// - 特定のチケット種別の詳細情報を取得・表示
/// - オプション情報の管理
/// - 匿名ユーザーでも利用可能
@riverpod
Future<TicketTypeWithOptionsResponse> ticketDetail(
  Ref ref,
  String ticketTypeId,
) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);

  try {
    return await ticketRepository.getTicketTypeWithOptions(ticketTypeId);
  } catch (error) {
    throw Exception('チケット詳細の取得に失敗しました: $error');
  }
}

/// 選択されたオプションの状態管理
@riverpod
class SelectedOptionsNotifier extends _$SelectedOptionsNotifier {
  @override
  Map<String, String> build() {
    return {};
  }

  /// オプションの選択状態を更新
  void updateOption(String optionId, String value) {
    state = {
      ...state,
      optionId: value,
    };
  }

  /// 特定のオプションの選択を削除
  void removeOption(String optionId) {
    final newState = Map<String, String>.from(state);
    newState.remove(optionId);
    state = newState;
  }

  /// すべてのオプション選択をクリア
  void clearAllOptions() {
    state = {};
  }

  /// 特定のオプションが選択されているかチェック
  bool isOptionSelected(String optionId) {
    return state.containsKey(optionId);
  }

  /// 選択されたオプションの値を取得
  String? getSelectedValue(String optionId) {
    return state[optionId];
  }
}

/// チケット購入リクエストの生成
@riverpod
TicketCheckoutRequest? ticketCheckoutRequest(
  Ref ref,
  String ticketTypeId,
) {
  final selectedOptions = ref.watch(selectedOptionsNotifierProvider);

  // 選択されたオプションをTicketOptionRequestに変換
  final options = selectedOptions.entries
      .map(
        (entry) => TicketOptionRequest(
          optionId: entry.key,
          value: entry.value,
        ),
      )
      .toList();

  return TicketCheckoutRequest(
    ticketTypeId: ticketTypeId,
    options: options,
  );
}

/// チケット価格計算
@riverpod
int ticketTotalPrice(Ref ref, String ticketTypeId) {
  final ticketDetailAsync = ref.watch(ticketDetailProvider(ticketTypeId));

  return ticketDetailAsync.when(
    data: (ticketDetail) {
      // 基本価格を取得
      final basePrice = ticketDetail.ticketType.price;

      // TODO: オプション価格の計算（オプションに価格情報が追加された場合）
      // 現在のdb_typesではTicketOptionsに価格情報がないため、基本価格のみ

      return basePrice;
    },
    loading: () => 0,
    error: (_, __) => 0,
  );
}
