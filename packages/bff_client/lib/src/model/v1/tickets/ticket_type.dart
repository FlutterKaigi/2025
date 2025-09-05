import 'package:db_types/db_types.dart' as db_types;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_type.freezed.dart';
part 'ticket_type.g.dart';

@freezed
abstract class TicketType with _$TicketType {
  const factory TicketType({
    required String id,
    required String name,
    required int price,
    required bool isActive,
    required String stripePriceId,
    int? maxQuantity,
    String? description,
  }) = _TicketType;

  factory TicketType.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeFromJson(json);
}

extension TicketTypeExtension on db_types.TicketTypes {
  TicketType toTicketType() => TicketType(
        id: id,
        name: name,
        price: price,
        isActive: isActive,
        stripePriceId: stripePriceId,
        maxQuantity: maxQuantity,
        description: description,
      );
}
