import 'package:app/core/api/api_exception.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:db_types/db_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  Future<UserAndUserRoles> build() async {
    final client = ref.watch(bffClientProvider);
    final response = await ApiException.transform(
      () => client.v1.users.getUserMe(),
    );
    ref.listen(authProvider, (_, _) => ref.invalidateSelf());
    return response.data;
  }

  // TODO ....
}
