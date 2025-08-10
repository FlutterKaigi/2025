import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:dashboard/features/account/provider/profile_provider.dart';
import 'package:dashboard/features/account/ui/component/account_circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// プロフィール編集画面
///
/// 主な役割:
/// - ユーザーのプロフィール情報を編集する
/// - アカウント情報画面から遷移して利用される
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class ProfileEditScreen extends ConsumerStatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  ConsumerState<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends ConsumerState<ProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 画面表示時にプロファイル情報を取得
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileNotifierProvider.notifier).fetchProfile();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(profileNotifierProvider);
    final formState = ref.watch(profileFormNotifierProvider);
    final formNotifier = ref.read(profileFormNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール編集'),
        actions: [
          TextButton(
            onPressed: () => _saveProfile(context),
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
                onPressed: () => ref.read(profileNotifierProvider.notifier).fetchProfile(),
                child: const Text('再試行'),
              ),
            ],
          ),
        ),
        data: (profile) {
          // プロファイルデータがロードされたらフォームに反映
          if (profile != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_nameController.text.isEmpty) {
                _nameController.text = profile.profile.name;
                _commentController.text = profile.profile.comment;
                formNotifier.loadFromProfile(profile);
              }
            });

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ネームプレート注意事項
                    if (!profile.canEditNameplate && profile.nameplateNote != null)
                      Card(
                        color: Theme.of(context).colorScheme.warningContainer,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.warning,
                                color: Theme.of(context).colorScheme.onWarningContainer,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  profile.nameplateNote!,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onWarningContainer,
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
                                onPressed: () => _uploadAvatar(),
                                icon: const Icon(Icons.upload),
                                label: const Text('アップロード'),
                              ),
                              if (profile.profile.avatarKey != null)
                                TextButton.icon(
                                  onPressed: () => _deleteAvatar(),
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
                      controller: _nameController,
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
                      onChanged: formNotifier.updateName,
                    ),
                    const SizedBox(height: 16),

                    // ひとことコメント
                    TextFormField(
                      controller: _commentController,
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
                      onChanged: formNotifier.updateComment,
                    ),
                    const SizedBox(height: 16),

                    // 成人確認
                    CheckboxListTile(
                      title: const Text('20歳以上です'),
                      value: formState.isAdult,
                      onChanged: (value) => formNotifier.updateIsAdult(value ?? false),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const SizedBox(height: 24),

                    // SNSリンク
                    Row(
                      children: [
                        const Text(
                          'SNSリンク',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: formNotifier.addSnsLink,
                          icon: const Icon(Icons.add),
                          label: const Text('追加'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // SNSリンクリスト
                    ...formState.snsLinks.asMap().entries.map((entry) {
                      final index = entry.key;
                      final link = entry.value;
                      return _SnsLinkForm(
                        key: ValueKey(index),
                        snsLink: link,
                        onChanged: (newLink) => formNotifier.updateSnsLink(index, newLink),
                        onRemove: () => formNotifier.removeSnsLink(index),
                      );
                    }).toList(),
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

  Future<void> _saveProfile(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final formNotifier = ref.read(profileFormNotifierProvider.notifier);
      final request = formNotifier.toRequest();
      await ref.read(profileNotifierProvider.notifier).updateProfile(request);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('プロファイルを更新しました')),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('更新に失敗しました: $e')),
        );
      }
    }
  }

  Future<void> _uploadAvatar() async {
    // TODO: ファイル選択とアップロード処理を実装
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('アバターアップロード機能は準備中です')),
    );
  }

  Future<void> _deleteAvatar() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('アバター削除'),
        content: const Text('アバター画像を削除しますか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('削除'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await ref.read(profileNotifierProvider.notifier).deleteAvatar();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('アバターを削除しました')),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('削除に失敗しました: $e')),
          );
        }
      }
    }
  }
}

class _SnsLinkForm extends StatefulWidget {
  const _SnsLinkForm({
    required this.snsLink,
    required this.onChanged,
    required this.onRemove,
    super.key,
  });

  final SnsLinkFormState snsLink;
  final ValueChanged<SnsLinkFormState> onChanged;
  final VoidCallback onRemove;

  @override
  State<_SnsLinkForm> createState() => _SnsLinkFormState();
}

class _SnsLinkFormState extends State<_SnsLinkForm> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.snsLink.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<SnsType>(
                    value: widget.snsLink.snsType,
                    decoration: const InputDecoration(
                      labelText: 'SNSタイプ',
                      border: OutlineInputBorder(),
                    ),
                    items: SnsType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(_getSnsTypeDisplayName(type)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      widget.onChanged(widget.snsLink.copyWith(snsType: value));
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: widget.onRemove,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            const SizedBox(height: 12),
                         TextFormField(
               controller: _controller,
               decoration: InputDecoration(
                 labelText: 'URL/ユーザーID',
                 border: const OutlineInputBorder(),
                 helperText: _getHelperText(widget.snsLink.snsType),
               ),
               validator: (value) {
                 if (value == null || value.trim().isEmpty) {
                   return 'URL/ユーザーIDを入力してください';
                 }
                 
                 final snsType = widget.snsLink.snsType;
                 if (snsType != null) {
                   final validationError = _validateSnsValue(snsType, value.trim());
                   if (validationError != null) {
                     return validationError;
                   }
                 }
                 
                 return null;
               },
               onChanged: (value) {
                 widget.onChanged(widget.snsLink.copyWith(value: value));
               },
             ),
          ],
        ),
      ),
    );
  }

  String _getSnsTypeDisplayName(SnsType type) {
    switch (type) {
      case SnsType.github:
        return 'GitHub';
      case SnsType.x:
        return 'X (Twitter)';
      case SnsType.discord:
        return 'Discord';
      case SnsType.medium:
        return 'Medium';
      case SnsType.qiita:
        return 'Qiita';
      case SnsType.zenn:
        return 'Zenn';
      case SnsType.note:
        return 'note';
      case SnsType.other:
        return 'その他';
    }
  }

  String? _getHelperText(SnsType? type) {
    if (type == null) return null;
    
    switch (type) {
      case SnsType.github:
        return '例: octocat または https://github.com/octocat';
      case SnsType.x:
        return '例: twitter または https://x.com/twitter';
      case SnsType.discord:
        return '例: 123456789012345678 (ユーザーID)';
      case SnsType.medium:
        return '例: username または https://medium.com/@username';
      case SnsType.qiita:
        return '例: username または https://qiita.com/username';
      case SnsType.zenn:
        return '例: username または https://zenn.dev/username';
      case SnsType.note:
        return '例: username または https://note.com/username';
      case SnsType.other:
        return '完全なURLを入力してください';
    }
  }

  String? _validateSnsValue(SnsType type, String value) {
    // URLが入力された場合はそのまま通す
    if (value.startsWith('http://') || value.startsWith('https://')) {
      try {
        Uri.parse(value);
        return null;
      } catch (e) {
        return '有効なURLを入力してください';
      }
    }

    // ユーザーIDの形式チェック
    switch (type) {
      case SnsType.github:
      case SnsType.x:
      case SnsType.medium:
      case SnsType.qiita:
      case SnsType.zenn:
      case SnsType.note:
        // 英数字、アンダースコア、ハイフンのみ許可
        if (!RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(value)) {
          return '英数字、アンダースコア、ハイフンのみ使用可能です';
        }
        break;
      case SnsType.discord:
        // DiscordユーザーIDは数字のみ（通常18桁）
        if (!RegExp(r'^\d{17,19}$').hasMatch(value)) {
          return 'DiscordユーザーIDは17-19桁の数字である必要があります';
        }
        break;
      case SnsType.other:
        // その他の場合はURLである必要がある
        return 'その他の場合は完全なURLを入力してください';
    }

    return null;
  }
}
