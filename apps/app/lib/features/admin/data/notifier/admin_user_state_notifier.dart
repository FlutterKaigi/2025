import 'package:app/core/api/api_exception.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:app/features/admin/data/model/admin_user_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_user_state_notifier.g.dart';

@riverpod
class AdminUserNotifier extends _$AdminUserNotifier {
  @override
  Future<AdminUserState> build(String userId) async {
    final client = ref.watch(bffClientProvider);
    final responses = await (
      ApiException.transform(
        () => client.v1.users.getUser(userId: userId),
      ),
      ApiException.transform(
        () => client.v1.tickets.getUserTicketsByUserId(userId),
      ),
    ).wait;
    return AdminUserState(
      user: responses.$1.data,
      tickets: responses.$2.tickets,
    );
  }
}
