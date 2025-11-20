import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_user_state.freezed.dart';
part 'admin_user_state.g.dart';

@freezed
abstract class AdminUserState with _$AdminUserState {
  const factory AdminUserState({
    required UserAndUserRoles user,
    required List<TicketItem> tickets,
  }) = _AdminUserState;

  factory AdminUserState.fromJson(Map<String, dynamic> json) =>
      _$AdminUserStateFromJson(json);
}
