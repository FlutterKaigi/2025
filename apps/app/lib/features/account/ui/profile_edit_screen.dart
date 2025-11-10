import 'package:app/core/designsystem/components/error_screen.dart';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final nameController = useTextEditingController();
    final snsLinksState = useState<List<SnsLinkFormData>>([]);
    final isAdultState = useState(false);

    Future<void> saveProfile() async {
      final t = Translations.of(context);
      if (!formKey.currentState!.validate()) {
        return;
      }

      try {
        // SNSリンクを変換（空でないもののみ）
        final validSnsLinks = snsLinksState.value
            .where(
              (link) => link.snsType != null && link.value.trim().isNotEmpty,
            )
            .map(
              (link) => SnsLink(
                snsType: link.snsType!,
                value: link.value.trim(),
              ),
            )
            .toList();

        final avatarKey = ref.read(profileProvider).value?.avatarKey;
        final request = ProfileUpdateRequest(
          name: nameController.text.trim(),
          isAdult: isAdultState.value,
          comment: '',
          snsLinks: validSnsLinks,
          avatarKey: avatarKey,
        );

        await ProfileNotifier.updateProfileMutation.run(
          ref,
          (transaction) async =>
              transaction.get(profileProvider.notifier).updateProfile(request),
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t.account.profile.saveSuccess),
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
                    child: Text(
                      '${t.account.profile.saveFailed}: '
                      '${e.errorMessage(t)}',
                    ),
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

    final profileAsync = ref.watch(profileProvider);
    final isPending =
        ref.watch(
          ProfileNotifier.updateProfileMutation.select(
            (state) => state.isPending,
          ),
        ) ||
        ref.watch(
          ProfileNotifier.avatarMutation.select((state) => state.isPending),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(t.account.profile.editTitle),
        actions: [
          TextButton(
            onPressed: isPending ? null : saveProfile,
            child: isPending
                ? const CircularProgressIndicator.adaptive()
                : Text(t.account.profile.save),
          ),
        ],
      ),
      body: profileAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${t.common.error.general.occurred}: $error'),
              ElevatedButton(
                onPressed: () => ref.invalidate(profileProvider),
                child: Text(t.common.error.server.retry),
              ),
            ],
          ),
        ),
        data: (profile) {
          // プロフィールデータがロードされたらフォームに反映
          useEffect(
            () {
              if (profile != null && nameController.text.isEmpty) {
                var name = profile.profile.name;
                if (name.length > 20) {
                  name = name.substring(0, 20);
                }
                nameController.text = name;
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
            },
            [profile],
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AvatarSection(profile: profile),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: t.account.profile.nameLabel,
                        border: const OutlineInputBorder(),
                      ),
                      maxLength: 20,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return t.account.profile.nameRequired;
                        }
                        return null;
                      },
                    ),
                    CheckboxListTile(
                      title: Text(t.account.profile.ageOver20),
                      value: isAdultState.value,
                      onChanged: (value) {
                        isAdultState.value = value ?? false;
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
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

class _AvatarSection extends HookConsumerWidget {
  const _AvatarSection({
    required this.profile,
  });

  final ProfileResponse? profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    final avatarMutationState = ref.watch(ProfileNotifier.avatarMutation);
    final profileMutationState = ref.watch(
      ProfileNotifier.updateProfileMutation,
    );
    final isPending =
        avatarMutationState.isPending || profileMutationState.isPending;

    return Center(
      child: Column(
        children: [
          AccountCircleImage(
            imageUrl: profile?.profile.avatarUrl?.toString() ?? '',
            imageSize: 120,
            circleRadius: 60,
          ),
          const SizedBox(height: 8),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 4,
            runSpacing: 4,
            children: [
              TextButton.icon(
                onPressed: isPending
                    ? null
                    : () async => ProfileNotifier.avatarMutation.run(
                        ref,
                        (tsx) => tsx
                            .get(changeAvatarActionProvider)
                            .changeAvatar(context: context),
                      ),
                icon: const Icon(Icons.upload),
                label: Text(t.account.profile.upload),
              ),
              if (profile?.profile.avatarUrl != null)
                TextButton.icon(
                  onPressed: isPending
                      ? null
                      : () async => ProfileNotifier.avatarMutation.run(
                          ref,
                          (tsx) => tsx
                              .get(changeAvatarActionProvider)
                              .deleteAvatar(context: context),
                        ),
                  icon: const Icon(Icons.delete),
                  label: Text(t.account.profile.delete),
                ),
            ],
          ),
        ],
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
