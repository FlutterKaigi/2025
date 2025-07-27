import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_types.freezed.dart';
part 'ticket_types.g.dart';

@freezed
abstract class TicketTypes with _$TicketTypes {
  const factory TicketTypes({
    required String id,
    required String name,
    required int price,
    int? maxQuantity,
    String? description,
    required bool isActive,
    @DateTimeConverter() DateTime? saleStartsAt,
    @DateTimeConverter() DateTime? saleEndsAt,
    required String stripePriceId,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _TicketTypes;

  factory TicketTypes.fromJson(Map<String, dynamic> json) =>
      _$TicketTypesFromJson(json);
}
