import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';

/// チケットオプション選択Widget
/// 
/// 機能:
/// - チケットオプションの選択UI
/// - オプション名と説明の表示
/// - 選択状態の管理
class TicketOptionSelector extends StatefulWidget {
  const TicketOptionSelector({
    required this.option,
    required this.onChanged,
    super.key,
  });

  final TicketOptions option;
  final ValueChanged<String?> onChanged;

  @override
  State<TicketOptionSelector> createState() => _TicketOptionSelectorState();
}

class _TicketOptionSelectorState extends State<TicketOptionSelector> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // オプション名
            Text(
              widget.option.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            
            // 説明文（ある場合）
            if (widget.option.description != null) ...[
              const SizedBox(height: 4),
              Text(
                widget.option.description!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
            
            const SizedBox(height: 12),
            
            // 選択UI（オプションの種類に応じて動的に変更）
            _buildOptionSelector(),
            
            // 在庫制限情報（ある場合）
            if (widget.option.maxQuantity != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.amber.shade300),
                ),
                child: Text(
                  '限定${widget.option.maxQuantity}個',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.amber.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOptionSelector() {
    // オプション名に基づいて適切なUIを選択
    final optionName = widget.option.name.toLowerCase();
    
    if (optionName.contains('懇親会') || optionName.contains('パーティー')) {
      return _buildYesNoSelector();
    } else if (optionName.contains('サイズ') || optionName.contains('size')) {
      return _buildSizeSelector();
    } else if (optionName.contains('食事') || optionName.contains('meal')) {
      return _buildMealSelector();
    } else {
      // デフォルトは Yes/No 選択
      return _buildYesNoSelector();
    }
  }

  Widget _buildYesNoSelector() {
    return Column(
      children: [
        RadioListTile<String>(
          title: const Text('参加する'),
          value: 'yes',
          groupValue: _selectedValue,
          onChanged: _updateSelection,
          contentPadding: EdgeInsets.zero,
        ),
        RadioListTile<String>(
          title: const Text('参加しない'),
          value: 'no',
          groupValue: _selectedValue,
          onChanged: _updateSelection,
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    const sizes = ['S', 'M', 'L', 'XL'];
    
    return Wrap(
      spacing: 8,
      children: sizes.map((size) {
        final isSelected = _selectedValue == size;
        return ChoiceChip(
          label: Text(size),
          selected: isSelected,
          onSelected: (selected) {
            _updateSelection(selected ? size : null);
          },
        );
      }).toList(),
    );
  }

  Widget _buildMealSelector() {
    const meals = [
      {'value': 'normal', 'label': '通常食'},
      {'value': 'vegetarian', 'label': 'ベジタリアン'},
      {'value': 'vegan', 'label': 'ビーガン'},
      {'value': 'halal', 'label': 'ハラル'},
    ];
    
    return Column(
      children: meals.map((meal) {
        return RadioListTile<String>(
          title: Text(meal['label']!),
          value: meal['value']!,
          groupValue: _selectedValue,
          onChanged: _updateSelection,
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  void _updateSelection(String? value) {
    setState(() {
      _selectedValue = value;
    });
    widget.onChanged(value);
  }
}