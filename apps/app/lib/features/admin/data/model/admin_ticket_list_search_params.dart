import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_ticket_list_search_params.freezed.dart';
part 'admin_ticket_list_search_params.g.dart';

/// チケット一覧の検索条件
@freezed
abstract class AdminTicketListSearchParams
    with _$AdminTicketListSearchParams {
  const factory AdminTicketListSearchParams({
    String? userId,
    String? ticketTypeId,
    String? status,
    bool? hasEntryLog,
    String? ticketOptionId,
  }) = _AdminTicketListSearchParams;

  factory AdminTicketListSearchParams.fromJson(Map<String, dynamic> json) =>
      _$AdminTicketListSearchParamsFromJson(json);
}
