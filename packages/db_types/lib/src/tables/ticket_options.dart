import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_options.freezed.dart';
part 'ticket_options.g.dart';

@freezed
abstract class TicketOptions with _$TicketOptions {
  const factory TicketOptions({
    required String id,
    required String ticketTypeId,
    required String name,
    String? description,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _TicketOptions;

  factory TicketOptions.fromJson(Map<String, dynamic> json) =>
      _$TicketOptionsFromJson(json);
}
