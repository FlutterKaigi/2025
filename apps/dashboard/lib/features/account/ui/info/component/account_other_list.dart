import 'package:flutter/material.dart';

typedef OtherList = ({String title, VoidCallback onTap});

final class AccountOtherList extends StatelessWidget {
  const AccountOtherList({
    required List<OtherList> items,
    super.key,
  }) : _items = items;

  final List<OtherList> _items;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _items.map((item) {
        return ListTile(
          title: Text(
            item.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          visualDensity: VisualDensity.comfortable,
          onTap: item.onTap,
        );
      }).toList(),
    );
  }
}
