import 'package:app/features/ticket/data/provider/ticket_types_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AvailableTicketListScreen extends ConsumerWidget {
  const AvailableTicketListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(ticketTypesProvider);
    return Container();
  }
}
