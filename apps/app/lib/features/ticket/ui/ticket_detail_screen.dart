import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/features/ticket/data/notifier/ticket_notifier.dart';
import 'package:app/features/ticket/ui/components/ticket_qr_card.dart';
import 'package:bff_client/bff_client.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TicketDetailScreen extends HookConsumerWidget {
  const TicketDetailScreen({required this.ticketId, super.key});

  final String ticketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketAsync = ref.watch(
      ticketProvider.select(
        (v) => v.whenData(
          (d) => d.whereType<TicketPurchaseItem>().firstWhereOrNull(
            (e) => e.purchase.id == ticketId && e.ticketType.isEntryAllowed,
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('チケット詳細'),
      ),
      body: switch (ticketAsync) {
        AsyncLoading() => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        AsyncError(:final error) => ErrorScreen(
          error: error,
          onRetry: () => ref.invalidate(ticketProvider),
        ),
        AsyncData(:final value) when value != null => SingleChildScrollView(
          child: TicketQrCard(item: value),
        ),
        AsyncData() => const Center(
          child: Text('Ticket that you are looking for is not found.'),
        ),
      },
    );
  }
}
