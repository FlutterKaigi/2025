import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TicketCheckoutSheet extends ConsumerWidget {
  const TicketCheckoutSheet._({required this.checkoutId, super.key});

  final String checkoutId;

  static Future<void> show(BuildContext context, String checkoutId) =>
      showDialog(
        fullscreenDialog: true,
        context: context,
        builder: (context) => TicketCheckoutSheet._(checkoutId: checkoutId),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final ticketTypeItem = ref.watch(
    //   ticketTypesProvider.select(
    //     (v) => v.value?.firstWhereOrNull(
    //       (element) => element.ticketType.id == checkoutId,
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('チケット購入'),
      ),
      body: Stepper(
        steps: const [
          Step(
            title: Text('チケットを確認してください'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text('チケットを確認してください'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
