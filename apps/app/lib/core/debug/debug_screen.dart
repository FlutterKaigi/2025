import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
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
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          spacing: 16,
          children: [
            _TransitionArea(),
            _TalkerArea(),
            _SessionsArea(),
            _LogoutArea(),
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

class _SessionsArea extends HookConsumerWidget {
  const _SessionsArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bffClient = ref.watch(bffClientProvider);
    final sessions = useState<List<SessionResponse>?>(null);
    final venues = useState<List<VenueWithSessionsResponse>?>(null);
    final isLoading = useState(false);
    final errorMessage = useState<String?>(null);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            const Text(
              'Sessions Debug',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              spacing: 16,
              children: [
                ElevatedButton(
                  onPressed: isLoading.value
                      ? null
                      : () async {
                          isLoading.value = true;
                          errorMessage.value = null;
                          try {
                            final response = await bffClient.v1.sessions
                                .getSessions();
                            sessions.value = response.sessions;
                          } on Exception catch (e) {
                            errorMessage.value = 'Sessions fetch failed: $e';
                          } finally {
                            isLoading.value = false;
                          }
                        },
                  child: const Text('Fetch Sessions'),
                ),
                ElevatedButton(
                  onPressed: isLoading.value
                      ? null
                      : () async {
                          isLoading.value = true;
                          errorMessage.value = null;
                          try {
                            final response = await bffClient.v1.sessions
                                .getSessionsByVenue();
                            venues.value = response.venues;
                          } on Exception catch (e) {
                            errorMessage.value = 'Venues fetch failed: $e';
                          } finally {
                            isLoading.value = false;
                          }
                        },
                  child: const Text('Fetch by Venues'),
                ),
              ],
            ),
            if (isLoading.value)
              const Center(child: CircularProgressIndicator()),
            if (errorMessage.value != null)
              Text(
                errorMessage.value!,
                style: const TextStyle(color: Colors.red),
              ),
            if (sessions.value != null) ...[
              Text(
                'Sessions (${sessions.value!.length})',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: sessions.value!.length,
                  itemBuilder: (context, index) {
                    final session = sessions.value![index];
                    return ListTile(
                      dense: true,
                      title: Text(session.title),
                      subtitle: Text(
                        '${session.startsAt} - ${session.endsAt}',
                      ),
                      trailing: session.isLightningTalk
                          ? const Icon(Icons.flash_on, size: 16)
                          : session.isBeginnersLightningTalk
                          ? const Icon(Icons.school, size: 16)
                          : session.isHandsOn
                          ? const Icon(Icons.build, size: 16)
                          : null,
                    );
                  },
                ),
              ),
            ],
            if (venues.value != null) ...[
              Text(
                'Venues (${venues.value!.length})',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: venues.value!.length,
                  itemBuilder: (context, index) {
                    final venue = venues.value![index];
                    return ExpansionTile(
                      dense: true,
                      title: Text('${venue.name} (${venue.sessions.length})'),
                      children: venue.sessions.map((session) {
                        return ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.only(left: 32),
                          title: Text(session.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${session.startsAt} - ${session.endsAt}'),
                              if (session.speakers.isNotEmpty)
                                Text(
                                  'Speakers: ${session.speakers.map((s) => s.name).join(', ')}',
                                ),
                            ],
                          ),
                          trailing: session.isLightningTalk
                              ? const Icon(Icons.flash_on, size: 16)
                              : session.isBeginnersLightningTalk
                              ? const Icon(Icons.school, size: 16)
                              : session.isHandsOn
                              ? const Icon(Icons.build, size: 16)
                              : null,
                        );
                      }).toList(),
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
}

class _LogoutArea extends ConsumerWidget {
  const _LogoutArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final authNotifier = ref.watch(authNotifierProvider.notifier);
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
