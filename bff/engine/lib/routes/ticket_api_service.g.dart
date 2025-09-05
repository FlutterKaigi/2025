// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_api_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$TicketApiServiceRouter(TicketApiService service) {
  final router = Router();
  router.add('GET', r'/types', service._getTicketTypes);
  router.add(
    'GET',
    r'/types/<ticketTypeId>',
    service._getTicketTypeWithOptions,
  );
  router.add('POST', r'/checkout', service._createCheckout);
  router.add('PUT', r'/checkout/<checkoutId>/cancel', service._cancelCheckout);
  router.add('GET', r'/me', service._getMyTickets);
  router.add('GET', r'/users/<userId>', service._getUserTickets);
  return router;
}
