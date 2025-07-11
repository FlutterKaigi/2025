import 'package:bff_client/bff_client.dart';
import 'package:dashboard/core/provider/bff_client.dart';
import 'package:dashboard/core/router/router.dart';
import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          spacing: 16,
          children: [
            _TransitionArea(),
            _BffArea(),
            _TalkerArea(),
          ],
        ),
      ),
    );
  }
}

class _TransitionArea extends HookWidget {
  const _TransitionArea();

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    final textController = useTextEditingController(text: '/event');
    final formKey = useMemoized(GlobalKey<FormState>.new, []);
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: RawAutocomplete<String>(
              focusNode: FocusNode(),
              textEditingController: textController,
              optionsBuilder: (textEditingValue) {
                final text = textEditingValue.text;
                if (text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return router.paths.where((p) => p.contains(text));
              },
              fieldViewBuilder:
                  (
                    context,
                    textEditingController,
                    focusNode,
                    onFieldSubmitted,
                  ) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'パスを入力してください';
                        }
                        if (!value.startsWith('/')) {
                          return 'パスは / で始めてください';
                        }
                        if (value.contains('debug') ||
                            value.contains('login')) {
                          return 'パスに「debug」または「login」を含めることはできません';
                        }
                        if (!router.canNavigate(value)) {
                          return '無効なパスです';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (value) {
                        onFieldSubmitted();
                      },
                    );
                  },
              onSelected: (selection) {
                textController.text = selection.replaceAll(':', '');
              },
              optionsViewBuilder: (context, onSelected, options) {
                final highlightedIndex = AutocompleteHighlightedOption.of(
                  context,
                );
                return Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Material(
                    elevation: 4,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),
                      // デバッグ画面なのでパフォーマンスは気にしない
                      // ignore: avoid_shrink_wrap_in_list_view
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          final option = options.elementAt(index);
                          return InkWell(
                            key: GlobalObjectKey(option),
                            onTap: () => onSelected(option),
                            child: Builder(
                              builder: (context) {
                                final isHighlight = highlightedIndex == index;
                                return Container(
                                  color: isHighlight
                                      ? Theme.of(context).focusColor
                                      : null,
                                  padding: const EdgeInsets.all(16),
                                  child: Text(option),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: FilledButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                final path = textController.text;
                router.go(path);
              },
              child: const Text('GO'),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}

class _TalkerArea extends StatelessWidget {
  const _TalkerArea();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () async => const TalkerRoute().push<void>(context),
        child: const Text('Talker 画面へ'),
      ),
    );
  }
}

class _BffArea extends ConsumerStatefulWidget {
  const _BffArea();

  @override
  ConsumerState<_BffArea> createState() => _BffAreaState();
}

class _BffAreaState extends ConsumerState<_BffArea> {
  UserAndUserRoles? _currentUser;
  List<UserAndUserRoles>? _userList;
  String? _errorMessage;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final bffClient = ref.watch(bffClientProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BFF Client Debug',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // エラーメッセージ表示
            if (_errorMessage != null) ...[
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 16),
            ],

            // ボタン群
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton(
                  onPressed: _isLoading
                      ? null
                      : () => _getCurrentUser(bffClient),
                  child: const Text('現在のユーザー情報取得'),
                ),
                FilledButton(
                  onPressed: _isLoading ? null : () => _getUserList(bffClient),
                  child: const Text('ユーザー一覧取得'),
                ),
                FilledButton(
                  onPressed: _isLoading ? null : _clearResults,
                  child: const Text('クリア'),
                ),
              ],
            ),

            // ローディング表示
            if (_isLoading) ...[
              const SizedBox(height: 16),
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],

            // 現在のユーザー情報表示
            if (_currentUser != null) ...[
              const SizedBox(height: 16),
              const Text(
                '現在のユーザー情報:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('名前: ${_currentUser!.authMetaData.name}'),
                    Text('メール: ${_currentUser!.authMetaData.email}'),
                    Text('ユーザーID: ${_currentUser!.user.id}'),
                    Text(
                      'ロール: ${_currentUser!.roles.map((r) => r.name).join(', ')}',
                    ),
                  ],
                ),
              ),
            ],

            // ユーザー一覧表示
            if (_userList != null) ...[
              const SizedBox(height: 16),
              const Text(
                'ユーザー一覧:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _userList!.length,
                  itemBuilder: (context, index) {
                    final user = _userList![index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            user.authMetaData.avatarUrl,
                          ),
                        ),
                        title: Text(user.authMetaData.name),
                        subtitle: Text(user.authMetaData.email),
                        trailing: Text(
                          user.roles.map((r) => r.name).join(', '),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _getCurrentUser(BffApiClient bffClient) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await bffClient.v1.users.getUserMe();
      setState(() {
        _currentUser = response.data;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '現在のユーザー情報取得に失敗しました: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _getUserList(BffApiClient bffClient) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await bffClient.v1.users.getUserList(
        limit: 10,
      );
      setState(() {
        _userList = response.data.users;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'ユーザー一覧取得に失敗しました: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _clearResults() {
    setState(() {
      _currentUser = null;
      _userList = null;
      _errorMessage = null;
    });
  }
}

extension _ToPaths on List<RouteBase> {
  List<String> toPaths([String? parentPath]) {
    final routes = <String>[];
    for (final routeBase in this) {
      switch (routeBase) {
        case GoRoute():
          final path = parentPath == null
              ? routeBase.path
              : p.join(parentPath, routeBase.path);
          routes.add(path);

          final childRouteBases = routeBase.routes;
          if (childRouteBases.isNotEmpty) {
            routes.addAll(childRouteBases.toPaths(path));
          }
        case ShellRoute() || StatefulShellRoute():
          routes.addAll(routeBase.routes.toPaths());
      }
    }
    return routes;
  }
}

extension _GoRouter on GoRouter {
  List<String> get paths => configuration.routes
      .toPaths()
      // debug と login は除外
      .where((path) => !path.contains('debug') && !path.contains('login'))
      .toList();

  bool canNavigate(String path) {
    for (final routePattern in paths) {
      final regExp = RegExp(
        '^${routePattern.replaceAll(RegExp(r':[^\\/]+'), '[a-zA-Z0-9]+')}/?\$',
      );
      if (regExp.hasMatch(path)) {
        return true;
      }
    }
    return false;
  }
}
