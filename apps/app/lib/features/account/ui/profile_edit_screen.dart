import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/account/data/model/sns_link_form_data.dart';
import 'package:app/features/account/data/notifier/profile_notifier.dart';
import 'package:app/features/account/ui/action/change_avatar_action.dart';
import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:app/features/account/ui/component/sns_link_form.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// プロフィール編集画面
///
/// 主な役割:
/// - ユーザーのプロフィール情報を編集する
/// - アカウント情報画面から遷移して利用される
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/app/SCREENS.md)
class ProfileEditScreen extends HookConsumerWidget {
  const ProfileEditScreen({super.key});

  /// プロファイルを保存する
  Future<void> _saveProfile(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController nameController,
    bool isAdult,
    List<SnsLinkFormData> snsLinks,
  ) async {
    final t = Translations.of(context);
    if (!formKey.currentState!.validate()) {
      return;
    }

    // 保存中の状態を表示
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 12),
              Text(t.account.profile.saving),
            ],
          ),
          duration: const Duration(seconds: 10),
        ),
      );
    }

    try {
      // SNSリンクを変換（空でないもののみ）
      final validSnsLinks = snsLinks
          .where((link) => link.snsType != null && link.value.trim().isNotEmpty)
          .map(
            (link) => SnsLink(
              snsType: link.snsType!,
              value: link.value.trim(),
            ),
          )
          .toList();

      final avatarKey = ref.read(profileNotifierProvider).value?.avatarKey;
      final request = ProfileUpdateRequest(
        name: nameController.text.trim(),
        isAdult: isAdult,
        comment: '',
        snsLinks: validSnsLinks,
        avatarKey: avatarKey,
      );

      final notifier = ref.read(profileNotifierProvider.notifier);
      await notifier.updateProfile(request);

      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                Text(t.account.profile.saveSuccess),
              ],
            ),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop();
      }
    } on Exception catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('${t.account.profile.saveFailed}: $e'),
                ),
              ],
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final t = Translations.of(context);

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final nameController = useTextEditingController();
    final snsLinksState = useState<List<SnsLinkFormData>>([]);
    final isAdultState = useState(false);

    final profileAsync = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.account.profile.editTitle),
        actions: [
          TextButton(
            onPressed: () => _saveProfile(
              context,
              ref,
              formKey,
              nameController,
              isAdultState.value,
              snsLinksState.value,
            ),
            child: Text(t.account.profile.save),
          ),
        ],
      ),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${t.common.error.general.occurred}: $error'),
              ElevatedButton(
                onPressed: () => ref.invalidate(profileNotifierProvider),
                child: Text(t.common.error.server.retry),
              ),
            ],
          ),
        ),
        data: (profile) {
          // プロファイルデータがロードされたらフォームに反映
          useEffect(() {
            if (profile != null && nameController.text.isEmpty) {
              nameController.text = profile.profile.name;
              isAdultState.value = profile.profile.isAdult;
              // 既存のSNSリンクがある場合は初期化
              if (profile.snsLinks.isNotEmpty) {
                snsLinksState.value = profile.snsLinks
                    .map(
                      (link) => SnsLinkFormData(
                        snsType: link.snsType,
                        value: link.value,
                      ),
                    )
                    .toList();
              }
            }
            return null;
          }, [profile]);

          final nameplateNote = profile?.nameplateNote;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ネームプレート注意事項（プロフィールが存在する場合のみ）
                    if (nameplateNote != null)
                      Card(
                        color: colorScheme.secondary.withValues(alpha: 0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.warning,
                                color: colorScheme.secondary,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  nameplateNote,
                                  style: TextStyle(
                                    color: colorScheme.onSecondaryContainer,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),

                    // アバター画像
                    Center(
                      child: Column(
                        children: [
                          AccountCircleImage(
                            imageUrl:
                                profile?.profile.avatarUrl?.toString() ?? '',
                            imageSize: 120,
                            circleRadius: 60,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton.icon(
                                onPressed: () async => ref
                                    .read(changeAvatarActionProvider)
                                    .changeAvatar(context: context),
                                icon: const Icon(Icons.upload),
                                label: Text(t.account.profile.upload),
                              ),
                              if (profile?.profile.avatarUrl != null)
                                TextButton.icon(
                                  onPressed: () async => ref
                                      .read(changeAvatarActionProvider)
                                      .deleteAvatar(context: context),
                                  icon: const Icon(Icons.delete),
                                  label: Text(t.account.profile.delete),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 名前
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: t.account.profile.nameLabel,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return t.account.profile.nameRequired;
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 16),

                    // 成人確認
                    CheckboxListTile(
                      title: Text(t.account.profile.ageOver20),
                      value: isAdultState.value,
                      onChanged: (value) {
                        isAdultState.value = value ?? false;
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const SizedBox(height: 24),

                    // SNSリンク
                    Row(
                      children: [
                        Text(
                          t.account.profile.snsLinks,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: () {
                            snsLinksState.value = [
                              ...snsLinksState.value,
                              const SnsLinkFormData(),
                            ];
                          },
                          icon: const Icon(Icons.add),
                          label: Text(t.account.profile.add),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // SNSリンクリスト
                    ...snsLinksState.value.asMap().entries.map((entry) {
                      final index = entry.key;
                      final link = entry.value;
                      return SnsLinkForm(
                        key: ValueKey(index),
                        snsLink: link,
                        onChanged: (newLink) {
                          final newList = [...snsLinksState.value];
                          newList[index] = newLink;
                          snsLinksState.value = newList;
                        },
                        onRemove: () {
                          final newList = [...snsLinksState.value];
                          newList.removeAt(index);
                          snsLinksState.value = newList;
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          );
        },
        skipLoadingOnRefresh: true,
        skipLoadingOnReload: true,
      ),
    );
  }
}

extension on ProfileResponse {
  String? get avatarKey {
    final avatarUrl = profile.avatarUrl;
    if (avatarUrl == null) {
      return null;
    }
    return avatarUrl.path.replaceFirst('/', '');
  }
}
