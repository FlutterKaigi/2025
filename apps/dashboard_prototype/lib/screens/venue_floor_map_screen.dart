import 'package:flutter/material.dart';

class VenueFloorMapScreen extends StatelessWidget {
  const VenueFloorMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('会場フロアマップ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.map,
              size: 100,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              '会場フロアマップ',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'ここに会場のフロアマップが表示されます',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}