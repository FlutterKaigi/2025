import 'package:app/features/account/data/model/sns_link_form_data.dart';
import 'package:app/features/account/data/provider/profile_provider.dart';
import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:app/features/account/ui/component/sns_link_form.dart';
import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
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
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class ProfileEditScreen extends HookConsumerWidget {
  const ProfileEditScreen({super.key});

  /// プロファイルを保存する
  Future<void> _saveProfile(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController nameController,
    TextEditingController commentController,
    bool isAdult,
    List<SnsLinkFormData> snsLinks,
  ) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    // 保存中の状態を表示
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              SizedBox(width: 12),
              Text('保存中...'),
            ],
          ),
          duration: Duration(seconds: 10),
        ),
      );
    }

    try {
      // SNSリンクを変換（空でないもののみ）
      final validSnsLinks = snsLinks
          .where((link) => link.snsType != null && link.value.trim().isNotEmpty)
          .map(
            (link) => SnsLinkData(
              snsType: link.snsType!,
              value: link.value.trim(),
            ),
          )
          .toList();

      final request = ProfileUpdateRequest(
        name: nameController.text.trim(),
        comment: commentController.text.trim(),
        isAdult: isAdult,
        snsLinks: validSnsLinks,
      );

      final notifier = ref.read(profileNotifierProvider.notifier);
      await notifier.updateProfile(request);

      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 8),
                Text('プロファイルを保存しました'),
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
                  child: Text('保存に失敗しました: $e'),
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

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final nameController = useTextEditingController();
    final commentController = useTextEditingController();
    final snsLinksState = useState<List<SnsLinkFormData>>([]);
    final isAdultState = useState(false);

    final profileAsync = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール編集'),
        actions: [
          TextButton(
            onPressed: () => _saveProfile(
              context,
              ref,
              formKey,
              nameController,
              commentController,
              isAdultState.value,
              snsLinksState.value,
            ),
            child: const Text('保存'),
          ),
        ],
      ),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('エラーが発生しました: $error'),
              ElevatedButton(
                onPressed: () => ref.invalidate(profileNotifierProvider),
                child: const Text('再試行'),
              ),
            ],
          ),
        ),
        data: (profile) {
          // プロファイルデータがロードされたらフォームに反映
          useEffect(() {
            if (profile != null && nameController.text.isEmpty) {
              nameController.text = profile.profile.name;
              commentController.text = profile.profile.comment;
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

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ネームプレート注意事項（プロフィールが存在する場合のみ）
                  if (profile != null &&
                      !profile.canEditNameplate &&
                      profile.nameplateNote != null)
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
                                profile.nameplateNote!,
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
                          imageUrl: profile?.profile.avatarKey ?? '',
                          imageSize: 120,
                          circleRadius: 60,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.upload),
                              label: const Text('アップロード'),
                            ),
                            if (profile?.profile.avatarKey != null)
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.delete),
                                label: const Text('削除'),
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
                    decoration: const InputDecoration(
                      labelText: '名前 *',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '名前を入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),

                  // ひとことコメント
                  TextFormField(
                    controller: commentController,
                    decoration: const InputDecoration(
                      labelText: 'ひとことコメント *',
                      border: OutlineInputBorder(),
                      helperText: '100文字以内',
                    ),
                    maxLength: 100,
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'ひとことコメントを入力してください';
                      }
                      if (value.length > 100) {
                        return 'ひとことコメントは100文字以内で入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),

                  // 成人確認
                  CheckboxListTile(
                    title: const Text('20歳以上です'),
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
                      const Text(
                        'SNSリンク',
                        style: TextStyle(
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
                        label: const Text('追加'),
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
          );
        },
      ),
    );
  }
}
