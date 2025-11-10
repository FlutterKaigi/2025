import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/admin/data/model/admin_user_list_search_params.dart';
import 'package:app/features/admin/data/notifier/admin_user_list_notifier.dart';
import 'package:app/features/admin/ui/components/admin_user_item.dart';
import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 管理者用ユーザ一覧画面
final class AdminUserListScreen extends HookConsumerWidget {
  const AdminUserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final searchParams = useState(const AdminUserListSearchParams());
    final emailController = useTextEditingController();
    final selectedRoles = useState<List<Role>>([]);
    final scrollController = PrimaryScrollController.of(context);

    final usersAsync = ref.watch(adminUserListProvider(searchParams.value));

    useEffect(
      () {
        Future<void> onScroll() async {
          final state = switch (usersAsync) {
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
                  .read(adminUserListProvider(searchParams.value).notifier)
                  .loadMore();
            }
          }
        }

        scrollController.addListener(onScroll);
        return () => scrollController.removeListener(onScroll);
      },
      [scrollController, usersAsync, searchParams.value],
    );

    useEffect(
      () {
        ref.invalidate(adminUserListProvider(searchParams.value));
        return null;
      },
      [searchParams.value],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(t.account.admin.userList),
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
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'メールアドレスで検索',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: emailController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                emailController.clear();
                                searchParams.value = searchParams.value
                                    .copyWith(
                                      email: '',
                                    );
                              },
                            )
                          : null,
                    ),
                    onChanged: (value) {
                      searchParams.value = searchParams.value.copyWith(
                        email: value.isEmpty ? null : value,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: Role.values
                          .map(
                            (role) => Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: FilterChip(
                                label: Text(role.name),
                                selected: selectedRoles.value.contains(role),
                                onSelected: (selected) {
                                  final newRoles = List<Role>.from(
                                    selectedRoles.value,
                                  );
                                  if (selected) {
                                    newRoles.add(role);
                                  } else {
                                    newRoles.remove(role);
                                  }
                                  selectedRoles.value = newRoles;
                                  searchParams.value = searchParams.value
                                      .copyWith(
                                        roles: newRoles.isEmpty
                                            ? null
                                            : newRoles,
                                      );
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: switch (usersAsync) {
                AsyncData(:final value) =>
                  value.users.isEmpty
                      ? const Center(
                          child: Text('ユーザーが見つかりませんでした'),
                        )
                      : RefreshIndicator(
                          onRefresh: () async => ref.refresh(
                            adminUserListProvider(searchParams.value).future,
                          ),
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount:
                                value.users.length + (value.hasMore ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index >= value.users.length) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                );
                              }
                              final user = value.users[index];
                              return AdminUserItem(
                                user: user,
                                onTap: () => AdminUserDetailRoute(
                                  userId: user.user.id,
                                ).go(context),
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
