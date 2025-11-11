// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_api_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$TicketApiServiceRouter(TicketApiService service) {
  final router = Router();
  router.add('GET', r'/types', service._getTicketTypes);
  router.add('POST', r'/checkout', service._createCheckout);
  router.add('PUT', r'/checkout/<checkoutId>/cancel', service._cancelCheckout);
  router.add('GET', r'/me', service._getMyTickets);
  router.add('GET', r'/users/<userId>', service._getUserTickets);
  router.add(
    'GET',
    r'/purchase/<ticketPurchaseId>',
    service._getTicketByPurchaseId,
  );
  router.add('PUT', r'/<ticketPurchaseId>/entry', service._putEntryLog);
  router.add('DELETE', r'/<ticketPurchaseId>/entry', service._deleteEntryLog);
  return router;
}
