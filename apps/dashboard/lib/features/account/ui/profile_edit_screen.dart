import 'package:dashboard/features/account/data/model/sns_link_form_data.dart';
import 'package:dashboard/features/account/provider/profile_provider.dart';
import 'package:dashboard/features/account/ui/component/account_circle_image.dart';
import 'package:dashboard/features/account/ui/component/sns_link_form.dart';
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
            onPressed: () {},
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
          if (profile != null) {
            useEffect(() {
              if (nameController.text.isEmpty) {
                nameController.text = profile.profile.name;
                commentController.text = profile.profile.comment;
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
                    // ネームプレート注意事項
                    if (!profile.canEditNameplate &&
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
                            imageUrl: profile.profile.avatarKey ?? '',
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
                              if (profile.profile.avatarKey != null)
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
          }

          return const Center(child: Text('プロファイル情報がありません'));
        },
      ),
    );
  }
}
