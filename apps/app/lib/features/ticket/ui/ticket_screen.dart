import 'package:app/core/designsystem/components/error_view.dart';
import 'package:app/features/ticket/data/notifier/ticket_notifier.dart';
import 'package:app/features/ticket/ui/components/ticket_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// チケット画面
class TicketScreen extends ConsumerWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketStatus = ref.watch(ticketNotifierProvider);

    const loading = Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );

    return ticketStatus.when(
      loading: () => loading,
      error: (error, stackTrace) => ErrorView(
        error: error,
        onRetry: () => ref.invalidate(ticketNotifierProvider),
        isRetrying: ref.watch(
          ticketNotifierProvider.select((v) => v.isLoading),
        ),
      ),
      data: (_) => const TicketListScreen(),
    );
  }
}
