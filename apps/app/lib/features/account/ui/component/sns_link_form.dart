import 'package:app/core/gen/i18n/i18n.g.dart';
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
    final t = Translations.of(context);
    final controller = useTextEditingController(text: snsLink.value);

    useEffect(
      () {
        if (controller.text != snsLink.value) {
          controller.text = snsLink.value;
        }
        return null;
      },
      [snsLink.value],
    );

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
                    decoration: InputDecoration(
                      labelText: t.account.profile.sns.type,
                      border: const OutlineInputBorder(),
                    ),
                    items: SnsType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type.displayName(t)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      onChanged(snsLink.copyWith(snsType: value));
                    },
                    autovalidateMode: AutovalidateMode.always,
                    autofocus: true,
                    validator: (value) => value == null
                        ? t.account.profile.sns.typeRequired
                        : null,
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
              autovalidateMode: AutovalidateMode.always,
              controller: controller,
              decoration: InputDecoration(
                labelText: t.account.profile.sns.urlOrUserId,
                border: const OutlineInputBorder(),
                helperText: snsLink.snsType?.helperText(t),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return t.account.profile.sns.urlOrUserIdRequired;
                }

                final snsType = snsLink.snsType;
                if (snsType != null) {
                  final validationError = snsType.validateValue(
                    value.trim(),
                    t,
                  );
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
  String displayName(Translations t) => switch (this) {
    SnsType.github => t.account.profile.sns.displayNames.github,
    SnsType.x => t.account.profile.sns.displayNames.x,
    SnsType.discord => t.account.profile.sns.displayNames.discord,
    SnsType.medium => t.account.profile.sns.displayNames.medium,
    SnsType.qiita => t.account.profile.sns.displayNames.qiita,
    SnsType.zenn => t.account.profile.sns.displayNames.zenn,
    SnsType.note => t.account.profile.sns.displayNames.note,
    SnsType.other => t.account.profile.sns.other,
  };

  /// ヘルパーテキスト
  String helperText(Translations t) => switch (this) {
    SnsType.github => t.account.profile.sns.examples.github,
    SnsType.x => t.account.profile.sns.examples.x,
    SnsType.discord => t.account.profile.sns.examples.discord,
    SnsType.medium => t.account.profile.sns.examples.medium,
    SnsType.qiita => t.account.profile.sns.examples.qiita,
    SnsType.zenn => t.account.profile.sns.examples.zenn,
    SnsType.note => t.account.profile.sns.examples.note,
    SnsType.other => t.account.profile.sns.fullUrlRequired,
  };

  /// SNS値のバリデーション
  String? validateValue(String value, Translations t) {
    final uriOrNull = Uri.tryParse(value);
    final isHttpUrl = uriOrNull?.scheme == 'http';
    final isHttpsUrl = uriOrNull?.scheme == 'https';

    final isValid = isHttpUrl || isHttpsUrl;
    // ユーザーIDの形式チェック
    return switch (this) {
      SnsType.other when uriOrNull == null || !isValid =>
        t.account.profile.sns.fullUrlRequired,
      SnsType.other when uriOrNull != null => null,
      _ when uriOrNull != null && isValid => t.account.profile.sns.userIdOnly,
      _ =>
        RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(value)
            ? null
            : t.account.profile.sns.alphanumericOnly,
    };
  }
}
