import 'package:app/core/designsystem/components/error_view.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/ticket/data/provider/ticket_types_provider.dart';
import 'package:app/features/ticket/ui/components/ticket_checkout_sheet.dart';
import 'package:app/features/ticket/ui/components/ticket_type_card.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AvailableTicketListScreen extends ConsumerWidget {
  const AvailableTicketListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final status = ref.watch(ticketTypesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.ticket.purchase.title),
      ),
      body: status.when(
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stackTrace) => ErrorView(
          error: error,
          onRetry: () => ref.invalidate(ticketTypesProvider),
          isRetrying: ref.watch(ticketTypesProvider.select((v) => v.isLoading)),
        ),
        data: (ticketTypes) => _TicketListView(ticketTypes: ticketTypes),
      ),
    );
  }
}

class _TicketListView extends StatelessWidget {
  const _TicketListView({
    required this.ticketTypes,
  });

  final List<TicketTypeWithOptionsItem> ticketTypes;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    if (ticketTypes.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            t.ticket.noAvailableTickets,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: ticketTypes.length,
      itemBuilder: (context, index) {
        final ticketTypeItem = ticketTypes[index];
        return TicketTypeCard(
          ticketTypeItem: ticketTypeItem,
          onCheckoutButtonPressed: () =>
              TicketCheckoutSheet.show(context, ticketTypeItem.ticketType.id),
        );
      },
    );
  }
}
