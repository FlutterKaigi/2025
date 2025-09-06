import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:app/features/ticket/data/repository/ticket_repository.dart';
import 'package:bff_client/bff_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_items_provider.g.dart';

@riverpod
Future<List<TicketItem>> ticketItems(Ref ref) async {
  final isAnonymousOrNull = ref.watch(
    authNotifierProvider.select((v) => v.value?.isAnonymous),
  );

  if (isAnonymousOrNull == null || isAnonymousOrNull) {
    return [];
  }

  final repository = ref.watch(ticketRepositoryProvider);
  return repository.getUserTickets();
}
