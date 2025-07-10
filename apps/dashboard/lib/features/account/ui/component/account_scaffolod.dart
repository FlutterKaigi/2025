import 'package:flutter/material.dart';

final class AccountScaffold extends StatelessWidget {
  const AccountScaffold({
    required Widget body,
    PreferredSizeWidget? appBar,
    super.key,
  }) : _appBar = appBar,
       _body = body;

  final PreferredSizeWidget? _appBar;
  final Widget _body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: _body,
        ),
      ),
    );
  }
}
