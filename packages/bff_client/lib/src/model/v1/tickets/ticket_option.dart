import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart' as db_types;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_option.freezed.dart';
part 'ticket_option.g.dart';

@freezed
abstract class TicketOption with _$TicketOption {
  const factory TicketOption({
    required String id,
    required String ticketTypeId,
    required String name,
    required TicketStatus status,
    String? description,
  }) = _TicketOption;

  factory TicketOption.fromJson(Map<String, dynamic> json) =>
      _$TicketOptionFromJson(json);
}

extension TicketOptionWithCountExtension on db_types.TicketOptionWithCount {
  TicketOption toTicketOption() {
    final maxQuantity = ticketOption.maxQuantity;
    // 在庫があるかどうか
    final hasStock =
        maxQuantity == null || (soldCount + reservedCount < maxQuantity);
    // 残り少ないかどうか (残り10枚以下)
    final isFewRemaining =
        !(maxQuantity == null) &&
        (maxQuantity - soldCount - reservedCount <= 10);

    final status = switch ((hasStock, isFewRemaining)) {
      (false, _) => const TicketStatus.soldOut(),
      (true, true) => const TicketStatus.selling(isFewRemaining: true),
      (true, false) => const TicketStatus.selling(isFewRemaining: false),
    };

    return TicketOption(
      id: ticketOption.id,
      ticketTypeId: ticketOption.ticketTypeId,
      name: ticketOption.name,
      description: ticketOption.description,
      status: status,
    );
  }
}
