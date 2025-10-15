import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/account/data/notifier/profile_notifier.dart';
import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:app/features/account/ui/component/account_scaffold.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:auth_client/auth_client.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アカウント情報画面
///
/// 主な役割:
/// - ユーザーのアカウント情報を表示する
/// - 匿名ユーザーの場合は適切な表示を行う
/// - プロフィール編集などの機能を提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/app/SCREENS.md)
final class AccountInfoScreen extends ConsumerWidget {
  const AccountInfoScreen({
    required VoidCallback onProfileEdit,
    required VoidCallback onTapCodeOfConductTile,
    required VoidCallback onTapPrivacyPolicyTile,
    required VoidCallback onTapContactTile,
    required VoidCallback onTapOssLicensesTile,
    required VoidCallback onTapWithdrawalTile,
    super.key,
  }) : _onProfileEdit = onProfileEdit,
       _onTapCodeOfConductTile = onTapCodeOfConductTile,
       _onTapPrivacyPolicyTile = onTapPrivacyPolicyTile,
       _onTapContactTile = onTapContactTile,
       _onTapOssLicensesTile = onTapOssLicensesTile,
       _onTapWithdrawalTile = onTapWithdrawalTile;

  final VoidCallback _onProfileEdit;
  final VoidCallback _onTapCodeOfConductTile;
  final VoidCallback _onTapPrivacyPolicyTile;
  final VoidCallback _onTapContactTile;
  final VoidCallback _onTapOssLicensesTile;
  final VoidCallback _onTapWithdrawalTile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authNotifierProvider);
    final t = Translations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return AccountScaffold(
      body: state.when(
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (user) => ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            if (user != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _UserInfoCard(
                  user: user,
                  onProfileEdit: _onProfileEdit,
                ),
              ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Text(
                t.account.others,
                style: textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 8),
            ...([
              (
                title: t.account.codeOfConduct,
                onTap: _onTapCodeOfConductTile,
              ),
              (
                title: t.account.privacyPolicy,
                onTap: _onTapPrivacyPolicyTile,
              ),
              (
                title: t.account.contact,
                onTap: _onTapContactTile,
              ),
              (
                title: t.account.ossLicenses,
                onTap: _onTapOssLicensesTile,
              ),
              // ゲストユーザーの場合は退会申請リンクを非表示
              if (user != null && !user.isAnonymous)
                (
                  title: t.account.withdrawal,
                  onTap: _onTapWithdrawalTile,
                ),
            ].map(
              (item) => _OtherListItem(
                title: item.title,
                onTap: item.onTap,
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      width: 210,
      height: 48,
      image: Assets.res.assets.googleSignInButton.provider(),
      fit: BoxFit.contain,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onPressed,
      ),
    );
  }
}

/// ユーザー情報表示カード
class _UserInfoCard extends ConsumerWidget {
  const _UserInfoCard({
    required this.user,
    required this.onProfileEdit,
  });

  final User user;
  final VoidCallback onProfileEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final translations = Translations.of(context);
    final children = user.isAnonymous
        ? [
            Text(
              translations.account.guestUserLabel,
              style: theme.textTheme.bodyLarge,
            ),
            _GoogleSignInButton(
              onPressed: () async {
                await ref
                    .read(authNotifierProvider.notifier)
                    .linkAnonymousUserWithGoogle();
              },
            ),
            const _LogoutButton(),
          ]
        : [
            _ProfileImage(
              user: user,
            ),
            Text(
              user.email ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onProfileEdit,
                icon: const Icon(Icons.edit),
                label: Text(translations.account.profileEdit),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.secondary,
                  foregroundColor: theme.colorScheme.onSecondary,
                  visualDensity: VisualDensity.comfortable,
                ),
              ),
            ),
            const _LogoutButton(),
          ];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outline,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          children: children,
        ),
      ),
    );
  }
}

extension on User {
  String? get avatarUrl {
    return userMetadata?['avatar_url']?.toString() ??
        identities?.firstOrNull?.identityData?['avatar_url']?.toString();
  }
}

/// ログアウトボタン用のカスタムウィジェット
class _LogoutButton extends ConsumerWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () async {
          await ref.read(authNotifierProvider.notifier).signOut();
        },
        icon: const Icon(Icons.logout),
        label: Text(t.account.logout),
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.error,
          side: BorderSide(
            color: colorScheme.error,
          ),
          visualDensity: VisualDensity.comfortable,
        ),
      ),
    );
  }
}

/// Othersアイテム用のカスタムウィジェット
class _OtherListItem extends StatelessWidget {
  const _OtherListItem({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(
        title,
        style: textTheme.bodyLarge,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: colorScheme.onSurfaceVariant,
      ),
      visualDensity: VisualDensity.comfortable,
      onTap: onTap,
    );
  }
}

/// プロフィール画像表示ウィジェット
///
/// - プロフィール画像を優先し、なければ Google アカウントの画像を表示する
/// - Google アカウントの画像には上に Google アイコンを表示する
/// - プロフィール画像も Google アカウントの画像も取得できない場合は、デフォルトのアイコン `Icons.person` を表示する
class _ProfileImage extends ConsumerWidget {
  const _ProfileImage({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileNotifierProvider);
    return SizedBox.square(
      dimension: 100,
      child: switch (profileAsync) {
        AsyncData(:final value) => () {
          final avatarUrl = value?.profile.avatarUrl;
          if (avatarUrl == null) {
            if (user.avatarUrl == null) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant,
                  ),
                ),
              );
            }
            return Stack(
              children: [
                AccountCircleImage(
                  imageUrl: user.avatarUrl!,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: FaIcon(FontAwesomeIcons.google),
                  ),
                ),
              ],
            );
          }
          return AccountCircleImage(
            imageUrl: avatarUrl.toString(),
          );
        }(),
        AsyncLoading() => const CircularProgressIndicator.adaptive(),
        AsyncError() => const Icon(Icons.error),
      },
    );
  }
}
