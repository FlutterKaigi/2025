import 'package:app/core/designsystem/components/error_view.dart';
import 'package:app/core/gen/l10n/l10n.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:app/features/ticket/data/notifier/ticket_notifier.dart';
import 'package:app/features/ticket/data/provider/ticket_types_provider.dart';
import 'package:app/features/ticket/ui/components/login_before_purchase_card.dart';
import 'package:app/features/ticket/ui/components/ticket_card.dart';
import 'package:app/features/ticket/ui/components/ticket_checkout_sheet.dart';
import 'package:app/features/ticket/ui/components/ticket_type_card.dart';
import 'package:app/features/ticket/ui/components/student_refund_dialog.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TicketListScreen extends ConsumerWidget {
  const TicketListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketItemsStatus = ref.watch(ticketNotifierProvider);
    final ticketTypesStatus = ref.watch(ticketTypesProvider);

    const loading = Center(
      child: CircularProgressIndicator.adaptive(),
    );

    return ticketItemsStatus.when(
      loading: () => loading,
      error: (error, stackTrace) => ErrorView(
        error: error,
        onRetry: () => ref.invalidate(ticketNotifierProvider),
        isRetrying: ref.watch(
          ticketNotifierProvider.select((v) => v.isLoading),
        ),
      ),
      data: (tickets) => ticketTypesStatus.when(
        loading: () => loading,
        error: (error, stackTrace) => ErrorView(
          error: error,
          onRetry: () => ref.invalidate(ticketTypesProvider),
          isRetrying: ref.watch(ticketTypesProvider.select((v) => v.isLoading)),
        ),
        data: (ticketTypes) => Scaffold(
          appBar: AppBar(
            title: const Text('チケット一覧'),
          ),
          body: _TicketsListView(
            tickets: tickets,
            ticketTypes: ticketTypes,
            onRefresh: () async {
              await (
                ref.refresh(ticketNotifierProvider.future),
                ref.refresh(ticketTypesProvider.future),
              ).wait;
            },
            isLoggedIn: ref.watch(
              authNotifierProvider.select((v) => v.value != null),
            ),
            isAnonymous: ref.watch(
              authNotifierProvider.select((v) => v.value?.isAnonymous ?? false),
            ),
          ),
        ),
      ),
    );
  }
}

class _TicketsListView extends HookWidget {
  const _TicketsListView({
    required this.tickets,
    required this.ticketTypes,
    required this.onRefresh,
    required this.isLoggedIn,
    required this.isAnonymous,
  });

  final List<TicketItem> tickets;
  final List<TicketTypeWithOptionsItem> ticketTypes;
  final Future<void> Function() onRefresh;
  final bool isLoggedIn;
  final bool isAnonymous;

  @override
  Widget build(BuildContext context) {
    // 未購入のチケット種別一覧
    final notPurchasedTicketTypes = useMemoized(
      () => ticketTypes
          .where(
            (ticketType) => !tickets.any(
              (ticket) => ticket.ticketType.id == ticketType.ticketType.id,
            ),
          )
          .toList(),
      [tickets, ticketTypes],
    );

    final isAuthorizedByGoogle = isLoggedIn && !isAnonymous;

    return RefreshIndicator.adaptive(
      onRefresh: onRefresh,
      child: CustomScrollView(
        primary: true,
        slivers: [
          if (!isLoggedIn)
            SliverToBoxAdapter(
              child: LoginBeforePurchaseCard.login(),
            )
          else if (isAnonymous)
            SliverToBoxAdapter(
              child: LoginBeforePurchaseCard.anonymous(),
            ),
          if (!isLoggedIn || isAnonymous)
            const SliverToBoxAdapter(
              child: Divider(),
            ),

          // チケット購入に関する注意事項
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: _TicketNoticeCallout(),
            ),
          ),

          // 学生向け返金・費用補助について
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: _StudentRefundCallout(),
            ),
          ),

          if (tickets.isNotEmpty)
            SliverPadding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
              sliver: SliverList.builder(
                itemBuilder: (context, index) =>
                    TicketCard(ticket: tickets[index]),
                itemCount: tickets.length,
              ),
            ),
          if (notPurchasedTicketTypes.isNotEmpty)
            SliverPadding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
              sliver: SliverList.builder(
                itemBuilder: (context, index) {
                  final ticketType = notPurchasedTicketTypes[index];
                  return TicketTypeCard(
                    ticketTypeItem: ticketType,
                    onCheckoutButtonPressed: isAuthorizedByGoogle
                        ? () => TicketCheckoutSheet.show(
                            context,
                            ticketType.ticketType.id,
                          )
                        : null,
                  );
                },
                itemCount: notPurchasedTicketTypes.length,
              ),
            ),
        ],
      ),
    );
  }
}

/// チケット購入に関する注意事項
class _TicketNoticeCallout extends StatelessWidget {
  const _TicketNoticeCallout();

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final textTheme = Theme.of(context).textTheme;
    const warningColor = Colors.amber;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: warningColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: warningColor.withValues(alpha: 0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: warningColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.ticketNoticeTitle,
                  style: textTheme.titleSmall?.copyWith(
                    color: warningColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              l10n.ticketNoticeMessage,
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

/// 学生向け返金・費用補助についてのコールアウト
class _StudentRefundCallout extends StatelessWidget {
  const _StudentRefundCallout();

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final textTheme = Theme.of(context).textTheme;
    const infoColor = Colors.blue;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: infoColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: infoColor.withValues(alpha: 0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.school,
                  color: infoColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l10n.studentRefundTitle,
                    style: textTheme.titleSmall?.copyWith(
                      color: infoColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              l10n.studentRefundDescription,
              style: textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: () => StudentRefundDialog.show(context),
                icon: const Icon(Icons.info_outline, size: 16),
                label: Text(l10n.studentRefundDetailsButton),
                style: FilledButton.styleFrom(
                  backgroundColor: infoColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
