// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ticket_type_with_options_and_counts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketTypeWithOptionsAndCounts _$TicketTypeWithOptionsAndCountsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketTypeWithOptionsAndCounts',
  json,
  ($checkedConvert) {
    final val = _TicketTypeWithOptionsAndCounts(
      ticketType: $checkedConvert(
        'ticket_type',
        (v) => TicketTypes.fromJson(v as Map<String, dynamic>),
      ),
      soldCount: $checkedConvert('sold_count', (v) => (v as num).toInt()),
      reservedCount: $checkedConvert(
        'reserved_count',
        (v) => (v as num).toInt(),
      ),
      options: $checkedConvert(
        'options',
        (v) => (v as List<dynamic>)
            .map(
              (e) => TicketOptionWithCount.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'ticketType': 'ticket_type',
    'soldCount': 'sold_count',
    'reservedCount': 'reserved_count',
  },
);

Map<String, dynamic> _$TicketTypeWithOptionsAndCountsToJson(
  _TicketTypeWithOptionsAndCounts instance,
) => <String, dynamic>{
  'ticket_type': instance.ticketType,
  'sold_count': instance.soldCount,
  'reserved_count': instance.reservedCount,
  'options': instance.options,
};

_TicketOptionWithCount _$TicketOptionWithCountFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TicketOptionWithCount',
  json,
  ($checkedConvert) {
    final val = _TicketOptionWithCount(
      ticketOption: $checkedConvert(
        'ticket_option',
        (v) => TicketOptions.fromJson(v as Map<String, dynamic>),
      ),
      soldCount: $checkedConvert('sold_count', (v) => (v as num).toInt()),
      reservedCount: $checkedConvert(
        'reserved_count',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'ticketOption': 'ticket_option',
    'soldCount': 'sold_count',
    'reservedCount': 'reserved_count',
  },
);

Map<String, dynamic> _$TicketOptionWithCountToJson(
  _TicketOptionWithCount instance,
) => <String, dynamic>{
  'ticket_option': instance.ticketOption,
  'sold_count': instance.soldCount,
  'reserved_count': instance.reservedCount,
};
