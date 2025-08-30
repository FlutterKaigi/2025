import 'package:dashboard/features/account/data/model/sns_link_form_data.dart';
import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// SnsType用のprivate extension
extension _SnsTypeExtension on SnsType {
  /// SNSタイプの表示名
  String get displayName => switch (this) {
    SnsType.github => 'GitHub',
    SnsType.x => 'X (Twitter)',
    SnsType.discord => 'Discord',
    SnsType.medium => 'Medium',
    SnsType.qiita => 'Qiita',
    SnsType.zenn => 'Zenn',
    SnsType.note => 'note',
    SnsType.other => 'その他',
  };

  /// ヘルパーテキスト
  String get helperText => switch (this) {
    SnsType.github => '例: octocat または https://github.com/octocat',
    SnsType.x => '例: twitter または https://x.com/twitter',
    SnsType.discord => '例: 123456789012345678 (ユーザーID)',
    SnsType.medium => '例: username または https://medium.com/@username',
    SnsType.qiita => '例: username または https://qiita.com/username',
    SnsType.zenn => '例: username または https://zenn.dev/username',
    SnsType.note => '例: username または https://note.com/username',
    SnsType.other => '完全なURLを入力してください',
  };

  /// SNS値のバリデーション
  String? validateValue(String value) {
    // URLが入力された場合はそのまま通す
    if (value.startsWith('http://') || value.startsWith('https://')) {
      try {
        Uri.parse(value);
        return null;
      } on FormatException {
        return '有効なURLを入力してください';
      }
    }

    // ユーザーIDの形式チェック
    return switch (this) {
      SnsType.github ||
      SnsType.x ||
      SnsType.medium ||
      SnsType.qiita ||
      SnsType.zenn ||
      SnsType.note =>
        RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(value)
            ? null
            : '英数字、アンダースコア、ハイフンのみ使用可能です',
      SnsType.discord =>
        RegExp(r'^\d{17,19}$').hasMatch(value)
            ? null
            : 'DiscordユーザーIDは17-19桁の数字である必要があります',
      SnsType.other => 'その他の場合は完全なURLを入力してください',
    };
  }
}

/// SNSリンクの入力フォームWidget
class SnsLinkForm extends HookWidget {
  const SnsLinkForm({
    required this.snsLink,
    required this.onChanged,
    required this.onRemove,
    super.key,
  });

  final SnsLinkFormData snsLink;
  final ValueChanged<SnsLinkFormData> onChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: snsLink.value);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<SnsType>(
                    initialValue: snsLink.snsType,
                    decoration: const InputDecoration(
                      labelText: 'SNSタイプ',
                      border: OutlineInputBorder(),
                    ),
                    items: SnsType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type.displayName),
                      );
                    }).toList(),
                    onChanged: (value) {
                      onChanged(snsLink.copyWith(snsType: value));
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: onRemove,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'URL/ユーザーID',
                border: const OutlineInputBorder(),
                helperText: snsLink.snsType?.helperText,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'URL/ユーザーIDを入力してください';
                }

                final snsType = snsLink.snsType;
                if (snsType != null) {
                  final validationError = snsType.validateValue(value.trim());
                  if (validationError != null) {
                    return validationError;
                  }
                }

                return null;
              },
              onChanged: (value) {
                onChanged(snsLink.copyWith(value: value));
              },
            ),
          ],
        ),
      ),
    );
  }
}
