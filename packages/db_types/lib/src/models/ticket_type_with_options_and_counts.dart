import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_type_with_options_and_counts.freezed.dart';
part 'ticket_type_with_options_and_counts.g.dart';

@freezed
abstract class TicketTypeWithOptionsAndCounts
    with _$TicketTypeWithOptionsAndCounts {
  const factory TicketTypeWithOptionsAndCounts({
    required TicketTypes ticketType,
    required int soldCount,
    required int reservedCount,
    required List<TicketOptionWithCount> options,
  }) = _TicketTypeWithOptionsAndCounts;

  factory TicketTypeWithOptionsAndCounts.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeWithOptionsAndCountsFromJson(json);
}

@freezed
abstract class TicketOptionWithCount with _$TicketOptionWithCount {
  const factory TicketOptionWithCount({
    required TicketOptions ticketOption,
    required int soldCount,
    required int reservedCount,
  }) = _TicketOptionWithCount;

  factory TicketOptionWithCount.fromJson(Map<String, dynamic> json) =>
      _$TicketOptionWithCountFromJson(json);
}
