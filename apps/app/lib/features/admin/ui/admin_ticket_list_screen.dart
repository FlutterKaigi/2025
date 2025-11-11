import 'package:app/core/router/router.dart';
import 'package:app/features/admin/data/model/admin_ticket_list_search_params.dart';
import 'package:app/features/admin/data/notifier/admin_ticket_list_notifier.dart';
import 'package:app/features/admin/ui/components/admin_ticket_item.dart';
import 'package:app/features/ticket/data/provider/ticket_types_provider.dart';
import 'package:bff_client/bff_client.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 管理者用チケット一覧画面
final class AdminTicketListScreen extends HookConsumerWidget {
  const AdminTicketListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchParams = useState(const AdminTicketListSearchParams());
    final userIdController = useTextEditingController();
    final selectedTicketTypeId = useState<String?>(null);
    final selectedStatus = useState<String?>(null);
    final selectedHasEntryLog = useState<bool?>(null);
    final selectedTicketOptionId = useState<String?>(null);
    final scrollController = PrimaryScrollController.of(context);

    useEffect(
      () {
        void listener() {
          if (userIdController.text.isEmpty) {
            searchParams.value = searchParams.value.copyWith(userId: null);
          }
        }

        userIdController.addListener(listener);
        return () => userIdController.removeListener(listener);
      },
      [userIdController],
    );

    final ticketsAsync = ref.watch(adminTicketListProvider(searchParams.value));
    final ticketTypesAsync = ref.watch(ticketTypesProvider);

    useEffect(
      () {
        Future<void> onScroll() async {
          final state = switch (ticketsAsync) {
            AsyncData(:final value) => value,
            _ => null,
          };
          if (state == null) {
            return;
          }

          if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent * 0.8) {
            if (state.hasMore) {
              await ref
                  .read(adminTicketListProvider(searchParams.value).notifier)
                  .loadMore();
            }
          }
        }

        scrollController.addListener(onScroll);
        return () => scrollController.removeListener(onScroll);
      },
      [scrollController, ticketsAsync, searchParams.value],
    );

    useEffect(
      () {
        ref.invalidate(adminTicketListProvider(searchParams.value));
        return null;
      },
      [searchParams.value],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('チケット検索'),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  TextField(
                    controller: userIdController,
                    decoration: InputDecoration(
                      hintText: 'ユーザーIDで検索',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: ValueListenableBuilder<TextEditingValue>(
                        valueListenable: userIdController,
                        builder: (context, value, child) {
                          return value.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    userIdController.clear();
                                    searchParams.value = searchParams.value
                                        .copyWith(
                                          userId: null,
                                        );
                                  },
                                )
                              : const SizedBox.shrink();
                        },
                      ),
                    ),
                    onChanged: (value) {
                      searchParams.value = searchParams.value.copyWith(
                        userId: value.isEmpty ? null : value,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'チケット種別',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 4),
                  ticketTypesAsync.when(
                    data: (ticketTypes) {
                      if (ticketTypes.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: FilterChip(
                                label: const Text('すべて'),
                                selected: selectedTicketTypeId.value == null,
                                onSelected: (selected) {
                                  if (selected) {
                                    selectedTicketTypeId.value = null;
                                    searchParams.value = searchParams.value
                                        .copyWith(
                                          ticketTypeId: null,
                                        );
                                  }
                                },
                              ),
                            ),
                            ...ticketTypes.map(
                              (ticketType) => Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: FilterChip(
                                  label: Text(ticketType.ticketType.name),
                                  selected:
                                      selectedTicketTypeId.value ==
                                      ticketType.ticketType.id,
                                  onSelected: (selected) {
                                    selectedTicketTypeId.value = selected
                                        ? ticketType.ticketType.id
                                        : null;
                                    searchParams.value = searchParams.value
                                        .copyWith(
                                          ticketTypeId: selected
                                              ? ticketType.ticketType.id
                                              : null,
                                        );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'オプション',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 4),
                  ticketTypesAsync.when(
                    data: (ticketTypes) {
                      final selectedType = ticketTypes.firstWhereOrNull(
                        (t) => t.ticketType.id == selectedTicketTypeId.value,
                      );
                      if (selectedType == null ||
                          selectedType.options.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: FilterChip(
                                label: const Text('すべて'),
                                selected: selectedTicketOptionId.value == null,
                                onSelected: (selected) {
                                  if (selected) {
                                    selectedTicketOptionId.value = null;
                                    searchParams.value = searchParams.value
                                        .copyWith(
                                          ticketOptionId: null,
                                        );
                                  }
                                },
                              ),
                            ),
                            ...selectedType.options.map(
                              (option) => Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: FilterChip(
                                  label: Text(option.name),
                                  selected: selectedTicketOptionId.value ==
                                      option.id,
                                  onSelected: (selected) {
                                    selectedTicketOptionId.value = selected
                                        ? option.id
                                        : null;
                                    searchParams.value = searchParams.value
                                        .copyWith(
                                          ticketOptionId:
                                              selected ? option.id : null,
                                        );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'ステータス',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 4),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: FilterChip(
                            label: const Text('すべて'),
                            selected: selectedStatus.value == null,
                            onSelected: (selected) {
                              if (selected) {
                                selectedStatus.value = null;
                                searchParams.value = searchParams.value
                                    .copyWith(
                                      status: null,
                                    );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: FilterChip(
                            label: const Text('購入済み'),
                            selected: selectedStatus.value == 'completed',
                            onSelected: (selected) {
                              selectedStatus.value = selected
                                  ? 'completed'
                                  : null;
                              searchParams.value = searchParams.value.copyWith(
                                status: selected ? 'completed' : null,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: FilterChip(
                            label: const Text('返金済み'),
                            selected: selectedStatus.value == 'refunded',
                            onSelected: (selected) {
                              selectedStatus.value = selected
                                  ? 'refunded'
                                  : null;
                              searchParams.value = searchParams.value.copyWith(
                                status: selected ? 'refunded' : null,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: FilterChip(
                            label: const Text('決済中'),
                            selected: selectedStatus.value == 'pending',
                            onSelected: (selected) {
                              selectedStatus.value = selected
                                  ? 'pending'
                                  : null;
                              searchParams.value = searchParams.value.copyWith(
                                status: selected ? 'pending' : null,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '入場履歴',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 4),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: FilterChip(
                            label: const Text('すべて'),
                            selected: selectedHasEntryLog.value == null,
                            onSelected: (selected) {
                              if (selected) {
                                selectedHasEntryLog.value = null;
                                searchParams.value = searchParams.value
                                    .copyWith(
                                      hasEntryLog: null,
                                    );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: FilterChip(
                            label: const Text('入場済み'),
                            selected: selectedHasEntryLog.value ?? false,
                            onSelected: (selected) {
                              selectedHasEntryLog.value = selected
                                  ? true
                                  : null;
                              searchParams.value = searchParams.value.copyWith(
                                hasEntryLog: selected ? true : null,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: FilterChip(
                            label: const Text('未入場'),
                            selected: selectedHasEntryLog.value == false,
                            onSelected: (selected) {
                              selectedHasEntryLog.value = selected
                                  ? false
                                  : null;
                              searchParams.value = searchParams.value.copyWith(
                                hasEntryLog: selected ? false : null,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: switch (ticketsAsync) {
                AsyncData(:final value) =>
                  value.tickets.isEmpty
                      ? const Center(
                          child: Text('チケットが見つかりませんでした'),
                        )
                      : RefreshIndicator(
                          onRefresh: () async => ref.refresh(
                            adminTicketListProvider(searchParams.value).future,
                          ),
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount:
                                value.tickets.length + (value.hasMore ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index >= value.tickets.length) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                );
                              }
                              final ticket = value.tickets[index];
                              return AdminTicketItem(
                                ticket: ticket,
                                onTap: () {
                                  final ticketId = switch (ticket) {
                                    TicketPurchaseItemWithUser(
                                      :final purchase,
                                    ) =>
                                      purchase.id,
                                    TicketCheckoutItemWithUser(
                                      :final checkout,
                                    ) =>
                                      checkout.id,
                                  };
                                  AdminTicketDetailRoute(
                                    ticketId: ticketId,
                                  ).push<void>(context);
                                },
                              );
                            },
                          ),
                        ),
                AsyncLoading() => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                AsyncError(:final error) => Center(
                  child: Text('エラーが発生しました: $error'),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
