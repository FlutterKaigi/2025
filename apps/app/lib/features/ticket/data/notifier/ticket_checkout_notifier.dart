import 'package:app/features/ticket/data/provider/ticket_items_provider.dart';
import 'package:app/features/ticket/data/repository/ticket_repository.dart';
import 'package:bff_client/bff_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_checkout_notifier.g.dart';

@riverpod
class TicketCheckoutNotifier extends _$TicketCheckoutNotifier {
  @override
  Future<List<TicketCheckoutItem>> build() async {
    final ticketItems = await ref.watch(ticketItemsProvider.future);
    ref.onDispose(() => ref.invalidate(ticketItemsProvider));
    return ticketItems.whereType<TicketCheckoutItem>().toList();
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
