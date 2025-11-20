import 'package:app/features/ticket/data/repository/ticket_repository.dart';
import 'package:bff_client/bff_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_types_provider.g.dart';

@riverpod
Future<List<TicketTypeWithOptionsItem>> ticketTypes(Ref ref) async {
  final repository = ref.watch(ticketRepositoryProvider);
  final response = await repository.getTicketTypes();
  return response.ticketTypes;
}
