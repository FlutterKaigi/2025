import 'package:dashboard/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
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
