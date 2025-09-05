import 'package:app/features/ticket/data/notifier/ticket_checkout_notifier.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActiveCheckoutScreen extends ConsumerWidget {
  const ActiveCheckoutScreen({required this.checkoutId, super.key});

  final String checkoutId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(
      ticketCheckoutNotifierProvider.select(
        (v) => v.whenData(
          (data) => data.firstWhereOrNull(
            (element) => element.checkout.id == checkoutId,
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('進行中の購入があります'),
      ),
      body: Column(
        children: [
          Text(status.toString()),

          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.payment),
            label: const Text('決済を続行'),
          ),
          // キャンセル
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.cancel),
            label: const Text('キャンセル'),
          ),
        ],
      ),
    );
  }
}
