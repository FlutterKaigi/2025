import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:app/features/ticket/data/repository/ticket_repository.dart';
import 'package:bff_client/bff_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_notifier.g.dart';

@riverpod
class TicketNotifier extends _$TicketNotifier {
  @override
  Future<List<TicketItem>> build() async {
    final isAnonymousOrNull = ref.watch(
      authNotifierProvider.select((v) => v.value?.isAnonymous),
    );

    if (isAnonymousOrNull == null || isAnonymousOrNull) {
      return [];
    }

    final repository = ref.watch(ticketRepositoryProvider);
    return repository.getUserTickets();
  }

  Future<TicketCheckoutSessionResponse> createCheckout(
    TicketCheckoutRequest request,
  ) async {
    final repository = ref.read(ticketRepositoryProvider);
    final response = await repository.createCheckout(request);
    ref.invalidateSelf(asReload: true);

    return response;
  }

  Future<void> cancelCheckout(String checkoutId) async {
    final repository = ref.read(ticketRepositoryProvider);
    await repository.cancelCheckout(checkoutId);
    ref.invalidateSelf(asReload: true);
  }
}
