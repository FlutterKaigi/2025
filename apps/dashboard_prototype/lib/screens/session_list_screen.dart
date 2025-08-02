import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SessionListScreen extends StatelessWidget {
  const SessionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('セッション一覧'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text('セッション ${index + 1}'),
              subtitle: Text('セッションの説明 ${index + 1}'),
              onTap: () {
                context.push('/sessions/session-$index');
              },
            ),
          );
        },
      ),
    );
  }
}