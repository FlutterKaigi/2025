import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/l10n/l10n.dart';
import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:app/features/account/ui/component/account_scaffold.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:auth_client/auth_client.dart';
import 'package:flutter/material.dart';
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
    super.key,
  }) : _onProfileEdit = onProfileEdit,
       _onTapCodeOfConductTile = onTapCodeOfConductTile,
       _onTapPrivacyPolicyTile = onTapPrivacyPolicyTile,
       _onTapContactTile = onTapContactTile,
       _onTapOssLicensesTile = onTapOssLicensesTile;

  final VoidCallback _onProfileEdit;
  final VoidCallback _onTapCodeOfConductTile;
  final VoidCallback _onTapPrivacyPolicyTile;
  final VoidCallback _onTapContactTile;
  final VoidCallback _onTapOssLicensesTile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authNotifierProvider);
    final l10n = L10n.of(context);
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
          padding: const EdgeInsets.all(16),
          children: [
            if (user != null)
              _UserInfoCard(
                user: user,
                onProfileEdit: _onProfileEdit,
              ),
            const SizedBox(height: 16),
            Text(
              l10n.accountOthers,
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ...([
              (
                title: l10n.accountCodeOfConduct,
                onTap: _onTapCodeOfConductTile,
              ),
              (
                title: l10n.accountPrivacyPolicy,
                onTap: _onTapPrivacyPolicyTile,
              ),
              (
                title: l10n.accountContact,
                onTap: _onTapContactTile,
              ),
              (
                title: l10n.accountOssLicenses,
                onTap: _onTapOssLicensesTile,
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
    final children = user.isAnonymous
        ? [
            Text(
              L10n.of(context).guestUserLabel,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            _GoogleSignInButton(
              onPressed: () async {
                await ref
                    .read(authNotifierProvider.notifier)
                    .linkAnonymousUserWithGoogle();
              },
            ),
            const SizedBox(height: 8),
            const _LogoutButton(isGuest: true),
          ]
        : [
            if (user.avatarUrl != null)
              AccountCircleImage(
                imageUrl: user.avatarUrl!,
              ),
            const SizedBox(height: 16),
            Text(
              user.email ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onProfileEdit,
                icon: const Icon(Icons.edit),
                label: Text(L10n.of(context).accountProfileEdit),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.secondary,
                  foregroundColor: Theme.of(
                    context,
                  ).colorScheme.onSecondary,
                  visualDensity: VisualDensity.comfortable,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const _LogoutButton(),
          ];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
  const _LogoutButton({
    this.isGuest = false,
  });

  final bool isGuest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: isGuest ? 210 : double.infinity,
      height: isGuest ? 48 : null,
      child: OutlinedButton.icon(
        onPressed: () async {
          await ref.read(authNotifierProvider.notifier).signOut();
        },
        icon: const Icon(Icons.logout),
        label: Text(l10n.accountLogout),
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.error,
          side: BorderSide(
            color: colorScheme.error,
          ),
          shape: isGuest
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                )
              : null,
          visualDensity: isGuest
              ? VisualDensity.standard
              : VisualDensity.comfortable,
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
