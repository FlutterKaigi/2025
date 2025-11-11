import 'package:bff_client/bff_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_ticket_list_state.freezed.dart';
part 'admin_ticket_list_state.g.dart';

@freezed
abstract class AdminTicketListState with _$AdminTicketListState {
  const factory AdminTicketListState({
    required List<TicketItemWithUser> tickets,
    required bool hasMore,
  }) = _AdminTicketListState;

  factory AdminTicketListState.fromJson(Map<String, dynamic> json) =>
      _$AdminTicketListStateFromJson(json);
}
