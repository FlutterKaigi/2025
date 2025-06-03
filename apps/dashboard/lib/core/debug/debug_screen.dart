import 'dart:async';

import 'package:dashboard/core/debug/talker.dart';
import 'package:dashboard/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;
import 'package:talker_flutter/talker_flutter.dart';

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

    final textController = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new, []);
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              controller: textController,
              autovalidateMode: AutovalidateMode.always,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'パスを入力してください';
                }
                if (!value.startsWith('/')) {
                  return 'パスは / で始めてください';
                }
                if (value.contains('debug') || value.contains('login')) {
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
            ),
          ),
          const SizedBox(width: 8),
          FilledButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) {
                return;
              }
              final path = textController.text;
              router.go(path);
            },
            child: const Text('GO'),
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
        onPressed: () async {
          // 動作確認用のログを出力
          talker.logCustom(
            TalkerLog(
              'custom',
              title: 'custom',
            ),
          );
          talker.critical('critical');
          talker.debug('debug');
          talker.error('error');
          talker.info('info');
          talker.verbose('verbose');
          talker.warning('warning');

          unawaited(
            const TalkerRoute().push<void>(context),
          );
        },
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
          var path = routeBase.path;
          if (parentPath != null) {
            path = p.join(parentPath, path);
          }
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
  bool canNavigate(String path) {
    final paths = configuration.routes.toPaths();
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
