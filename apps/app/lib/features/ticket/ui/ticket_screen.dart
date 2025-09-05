import 'package:app/features/ticket/data/notifier/ticket_checkout_notifier.dart';
import 'package:app/features/ticket/data/provider/ticket_items_provider.dart';
import 'package:app/features/ticket/ui/components/active_checkout_screen.dart';
import 'package:app/features/ticket/ui/components/available_ticket_list_screen.dart';
import 'package:app/features/ticket/ui/components/ticket_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// チケット画面
class TicketScreen extends ConsumerWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketStatus = ref.watch(ticketItemsProvider);
    final checkoutStatus = ref.watch(ticketCheckoutNotifierProvider);

    return ticketStatus.when(
      loading: () => const _Loading(),
      error: (error, stackTrace) => _Error(
        error: error,
        onRetry: () => ref.invalidate(ticketItemsProvider),
        isLoading: ref.watch(ticketItemsProvider.select((v) => v.isLoading)),
      ),
      data: (tickets) => checkoutStatus.when(
        loading: () => const _Loading(),
        error: (error, stackTrace) => _Error(
          error: error,
          onRetry: () => ref.invalidate(ticketCheckoutNotifierProvider),
          isLoading: ref.watch(
            ticketCheckoutNotifierProvider.select((v) => v.isLoading),
          ),
        ),
        data: (checkout) {
          // 進行中のチェックアウトセッションがある場合
          if (checkout.isNotEmpty) {
            return ActiveCheckoutScreen(checkoutId: checkout.first.checkout.id);
          }
          // 有効なチケットがある場合
          if (tickets.isNotEmpty) {
            return const TicketListScreen();
          }
          // チケットが無い場合
          return const AvailableTicketListScreen();
        },
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

class _Error extends ConsumerWidget {
  const _Error({
    required this.error,
    required this.onRetry,
    required this.isLoading,
    super.key,
  });

  final Object error;
  final VoidCallback onRetry;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final body = Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),

        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: theme.colorScheme.error,
            ),
            Text(error.toString()),
            if (isLoading)
              const CircularProgressIndicator.adaptive()
            else
              FilledButton(
                onPressed: onRetry,
                child: const Text('再試行'),
              ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
