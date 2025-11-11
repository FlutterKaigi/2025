import 'package:app/core/api/api_exception.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entry_log_notifier.g.dart';

/// 入場履歴を管理するNotifier
@riverpod
class EntryLogManager extends _$EntryLogManager {
  @override
  FutureOr<void> build() {}

  /// 入場履歴を追加/更新
  Future<void> putEntryLog(String ticketPurchaseId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final client = ref.read(bffClientProvider);
      await ApiException.transform(
        () => client.v1.tickets.putEntryLog(ticketPurchaseId),
      );
    });
  }

  /// 入場履歴を削除
  Future<void> deleteEntryLog(String ticketPurchaseId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final client = ref.read(bffClientProvider);
      await ApiException.transform(
        () => client.v1.tickets.deleteEntryLog(ticketPurchaseId),
      );
    });
  }
}
