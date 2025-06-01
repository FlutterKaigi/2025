import 'package:dashboard/core/router/router.dart';
import 'package:flutter/material.dart';

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
          onPressed: () => const TalkerRoute().push<void>(context),
          child: const Text('Talker 画面へ'),
        ),
      ),
    );
  }
}
