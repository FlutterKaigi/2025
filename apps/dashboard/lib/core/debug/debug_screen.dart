import 'dart:async';

import 'package:dashboard/core/router/router.dart';
import 'package:dashboard/core/util/talker.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug'),
      ),
      body: Center(
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
      ),
    );
  }
}
