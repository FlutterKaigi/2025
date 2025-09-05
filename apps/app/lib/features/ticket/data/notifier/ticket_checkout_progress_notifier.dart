import 'package:app/core/provider/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_checkout_progress_notifier.g.dart';

@riverpod
class TicketCheckoutProgressNotifier extends _$TicketCheckoutProgressNotifier {
  @override
  Future<int> build() async {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    final progress = await sharedPreferences.getInt(sharedPreferencesKey);
    return progress ?? 0;
  }

  static const String sharedPreferencesKey = 'ticket_checkout_progress';

  Future<void> setProgress(int progress) async {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    state = AsyncData(progress);
    await sharedPreferences.setInt(sharedPreferencesKey, progress);
  }
}
