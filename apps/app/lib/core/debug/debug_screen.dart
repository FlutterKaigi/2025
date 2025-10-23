import 'package:app/core/api/api_exception.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.common.debug.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          spacing: 16,
          children: [
            const _TransitionArea(),
            const _TalkerArea(),
            const _LogoutArea(),
            Consumer(
              builder: (context, ref, child) {
                final user = ref.watch(authProvider);
                final userId = user.value?.id;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Text('UserID: ${userId ?? 'Not authenticated'}'),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () => Clipboard.setData(
                        ClipboardData(text: userId ?? 'Not authenticated'),
                      ),
                    ),
                  ],
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return Column(
                  children: [
                    ListTile(
                      title: const Text('Check Profile Shares'),
                      onTap: () async {
                        try {
                          final profileShareList = await ApiException.transform(
                            () async => ref
                                .read(bffClientProvider)
                                .v1
                                .profileShare
                                .getMyProfileShareList(),
                          );
                          final response = profileShareList.data;
                          if (context.mounted) {
                            return showDialog<void>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Profile Shares'),
                                content: Text(
                                  response.map((e) => e.toJson()).join('\n'),
                                ),
                              ),
                            );
                          }
                        } on ApiException catch (e) {
                          if (context.mounted) {
                            return showDialog<void>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Error'),
                                content: Text(
                                  e.errorMessage(Translations.of(context)),
                                ),
                              ),
                            );
                          }
                        }
                      },
                    ),

                    ListTile(
                      title: const Text('Add Profile Share'),
                      onTap: () async {
                        try {
                          await ApiException.transform(
                            () async => ref
                                .read(bffClientProvider)
                                .v1
                                .profileShare
                                .putProfileShare(
                                  profileId:
                                      'e9ee7d4d-143b-425f-86dc-13342f0af3d1',
                                ),
                          );
                          if (context.mounted) {
                            return showDialog<void>(
                              context: context,
                              builder: (context) => const AlertDialog(
                                title: Text('Profile Shares'),
                                content: Text('Profile Share added'),
                              ),
                            );
                          }
                        } on ApiException catch (e) {
                          if (context.mounted) {
                            return showDialog<void>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Error'),
                                content: Text(
                                  e.errorMessage(Translations.of(context)),
                                ),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ],
                );
              },
            ),
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
    final t = Translations.of(context);
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
                          return t.common.debug.pathRequired;
                        }
                        if (!value.startsWith('/')) {
                          return t.common.debug.pathMustStartWithSlash;
                        }
                        if (value.contains('debug') ||
                            value.contains('login')) {
                          return t.common.debug.pathCannotContainDebugOrLogin;
                        }
                        if (!router.canNavigate(value)) {
                          return t.common.debug.invalidPath;
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
              child: Text(t.common.debug.go),
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
    final t = Translations.of(context);
    return Center(
      child: FilledButton(
        onPressed: () async => const TalkerRoute().push<void>(context),
        child: Text(t.common.debug.talkerScreen),
      ),
    );
  }
}

class _LogoutArea extends ConsumerWidget {
  const _LogoutArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final authNotifier = ref.watch(authProvider.notifier);
    return FilledButton(
      onPressed: () async => authNotifier.signOut(),
      child: Text(t.account.logout),
    );
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
