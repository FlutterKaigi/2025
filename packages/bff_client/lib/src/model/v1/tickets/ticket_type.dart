import 'package:bff_client/bff_client.dart';
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
    required TicketStatus status,
    required String stripePriceId,
    required bool isEntryAllowed,
    String? description,
  }) = _TicketType;

  factory TicketType.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeFromJson(json);
}

@Freezed(unionKey: 'type')
sealed class TicketStatus with _$TicketStatus {
  const factory TicketStatus.selling({
    /// 残り少ないかどうか
    required bool isFewRemaining,
  }) = TicketStatusSelling;

  const factory TicketStatus.soldOut() = TicketStatusSoldOut;

  const factory TicketStatus.notSelling() = TicketStatusNotSelling;

  factory TicketStatus.fromJson(Map<String, dynamic> json) =>
      _$TicketStatusFromJson(json);
}

extension TicketTypeWithOptionsAndCountsExtension
    on db_types.TicketTypeWithOptionsAndCounts {
  TicketType toTicketItem() {
    // 在庫があるかどうか
    final maxQuantity = ticketType.maxQuantity;
    final hasStock =
        maxQuantity == null || (soldCount + reservedCount < maxQuantity);
    // 残り少ないかどうか (残り10枚以下)
    final isFewRemaining =
        !(maxQuantity == null) &&
        (maxQuantity - soldCount - reservedCount <= 10);

    final status = switch ((
      hasStock,
      isFewRemaining,
      ticketType.isActive,
    )) {
      (_, _, false) => const TicketStatus.notSelling(),
      (false, _, _) => const TicketStatus.soldOut(),
      (true, true, _) => const TicketStatus.selling(isFewRemaining: true),
      (true, false, _) => const TicketStatus.selling(isFewRemaining: false),
    };

    return TicketType(
      id: ticketType.id,
      name: ticketType.name,
      price: ticketType.price,
      status: status,
      stripePriceId: ticketType.stripePriceId,
      description: ticketType.description,
      isEntryAllowed: ticketType.isEntryAllowed,
    );
  }

  TicketTypeWithOptionsItem toTicketTypeWithOptionsItem() {
    return TicketTypeWithOptionsItem(
      ticketType: toTicketItem(),
      options: options.map((e) => e.toTicketOption()).toList(),
    );
  }
}
