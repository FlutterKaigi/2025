import 'package:app/features/account/data/model/sns_link_form_data.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
    SnsType.github => '例: octocat',
    SnsType.x => '例: twitter',
    SnsType.discord => '例: 123456789012345678 (ユーザーID)',
    SnsType.medium => '例: username',
    SnsType.qiita => '例: username',
    SnsType.zenn => '例: username',
    SnsType.note => '例: username',
    SnsType.other => '完全なURLを入力してください',
  };

  /// SNS値のバリデーション
  String? validateValue(String value) {
    final uriOrNull = Uri.tryParse(value);
    final isHttpUrl = uriOrNull?.scheme == 'https';
    final isHttpsUrl = uriOrNull?.scheme == 'https';

    final isValid = isHttpUrl || isHttpsUrl;
    // ユーザーIDの形式チェック
    return switch (this) {
      SnsType.other when uriOrNull == null || !isValid => '完全なURLを入力してください',
      SnsType.other when uriOrNull != null => null,
      _ when uriOrNull != null && isValid => 'ユーザーIDのみを入力してください',
      _ =>
        RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(value)
            ? null
            : '英数字、アンダースコア、ハイフンのみ使用可能です',
    };
  }
}
