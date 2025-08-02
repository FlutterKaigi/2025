import 'package:flutter/material.dart';

class AccountScaffold extends StatelessWidget {
  const AccountScaffold({
    required this.body,
    this.appBar,
    super.key,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? AppBar(
        title: const Text('アカウント'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: body,
      ),
    );
  }
}