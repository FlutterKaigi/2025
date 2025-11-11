import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/assets/fonts.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/provider/environment.dart';
import 'package:app/features/account/data/notifier/profile_notifier.dart';
import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:app/features/account/ui/component/login_prompt_card.dart';
import 'package:app/features/account/ui/component/profile_info_section.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:app/features/user/data/notifier/user_notifier.dart';
import 'package:auth_client/auth_client.dart';
import 'package:db_types/db_types.dart' as db_types;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/link.dart';

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
    required VoidCallback onTapQrCode,
    required VoidCallback onTapQrCodeScan,
    required VoidCallback onTapFriendsList,
    required VoidCallback onTapCodeOfConductTile,
    required VoidCallback onTapPrivacyPolicyTile,
    required VoidCallback onTapContactTile,
    required VoidCallback onTapOssLicensesTile,
    required VoidCallback onTapWithdrawalTile,
    required VoidCallback onTapStaffMembers,
    required VoidCallback onTapAdminPage,
    super.key,
  }) : _onProfileEdit = onProfileEdit,
       _onTapQrCode = onTapQrCode,
       _onTapQrCodeScan = onTapQrCodeScan,
       _onTapFriendsList = onTapFriendsList,
       _onTapCodeOfConductTile = onTapCodeOfConductTile,
       _onTapPrivacyPolicyTile = onTapPrivacyPolicyTile,
       _onTapContactTile = onTapContactTile,
       _onTapOssLicensesTile = onTapOssLicensesTile,
       _onTapWithdrawalTile = onTapWithdrawalTile,
       _onTapStaffMembers = onTapStaffMembers,
       _onTapAdminPage = onTapAdminPage;

  final VoidCallback _onProfileEdit;
  final VoidCallback _onTapQrCode;
  final VoidCallback _onTapQrCodeScan;
  final VoidCallback _onTapFriendsList;
  final VoidCallback _onTapCodeOfConductTile;
  final VoidCallback _onTapPrivacyPolicyTile;
  final VoidCallback _onTapContactTile;
  final VoidCallback _onTapOssLicensesTile;
  final VoidCallback _onTapWithdrawalTile;
  final VoidCallback _onTapStaffMembers;
  final VoidCallback _onTapAdminPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;

    final commitInformation = ref.watch(environmentProvider).commitInformation;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.account.settings),
      ),
      body: state.when(
        error: (error, stackTrace) => SafeArea(
          child: ErrorScreen(
            error: error,
            onRetry: () => ref.invalidate(authProvider),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        data: (user) => user == null
            ? const SafeArea(child: LoginPromptCard())
            : Consumer(
                builder: (context, ref, _) {
                  final userAsync = ref.watch(userProvider);
                  final isAdmin = userAsync.maybeWhen(
                    data: (userAndRoles) =>
                        userAndRoles.roles.contains(db_types.Role.admin),
                    orElse: () => false,
                  );

                  return ListView(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    children: [
                      const SafeArea(child: SizedBox.shrink()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _UserInfoCard(
                          user: user,
                          onProfileEdit: _onProfileEdit,
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (!user.isAnonymous) ...[
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 16),
                          child: Text(
                            t.account.profileshare.title,
                            style: textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _SectionListItem(
                          title: t.account.profileshare.qrCode,
                          onTap: _onTapQrCode,
                        ),
                        _SectionListItem(
                          title: t.account.profileshare.qrCodeScan,
                          onTap: _onTapQrCodeScan,
                        ),
                        _SectionListItem(
                          title: t.account.profileshare.friendsList,
                          onTap: _onTapFriendsList,
                        ),
                        const SizedBox(height: 16),
                      ],
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 16),
                        child: Text(
                          t.account.contributors,
                          style: textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _SectionListItem(
                        title: t.account.staffMembers.title,
                        onTap: _onTapStaffMembers,
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
                        if (!user.isAnonymous)
                          (
                            title: t.account.withdrawal,
                            onTap: _onTapWithdrawalTile,
                          ),
                      ].map(
                        (item) => _SectionListItem(
                          title: item.title,
                          onTap: item.onTap,
                        ),
                      )),
                      const SizedBox(
                        height: 8,
                      ),
                      // Flutter, Dart version
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text:
                                      'Powered by Flutter '
                                      '${FlutterVersion.version}\n',

                                  style: TextStyle(
                                    fontVariations: [
                                      FontVariation('wght', 700),
                                      FontVariation('wdth', 125),
                                    ],
                                  ),
                                ),
                                const TextSpan(
                                  text: 'Dart ${FlutterVersion.dartVersion}',
                                ),
                                if (commitInformation != null)
                                  TextSpan(
                                    text: '\nCommit: $commitInformation',
                                  ),
                              ],
                            ),
                            style: textTheme.bodySmall!.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontFamily: FontFamily.notoSansMono,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Link(
                            uri: Uri.parse(
                              'https://github.com/FlutterKaigi/2025',
                            ),
                            builder: (context, followLink) =>
                                OutlinedButton.icon(
                                  onPressed: followLink,
                                  icon: const FaIcon(
                                    FontAwesomeIcons.github,
                                    size: 16,
                                  ),
                                  label: Text(t.account.sourceCode),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: theme.colorScheme.primary,
                                    side: BorderSide(
                                      color: theme.colorScheme.outline,
                                    ),
                                  ),
                                ),
                          ),
                        ),
                      ),
                      if (isAdmin)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ElevatedButton.icon(
                            onPressed: _onTapAdminPage,
                            icon: const Icon(Icons.admin_panel_settings),
                            label: Text(t.account.admin.button),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: theme.colorScheme.onPrimary,
                              visualDensity: VisualDensity.comfortable,
                            ),
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      const SizedBox(height: 16),
                    ],
                  );
                },
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
    final colorScheme = theme.colorScheme;
    final translations = Translations.of(context);
    final profileAsync = ref.watch(profileProvider);
    final userAsync = ref.watch(userProvider);

    final roles = userAsync.maybeWhen(
      data: (userAndRoles) => userAndRoles.roles,
      orElse: () => <db_types.Role>[],
    );

    final children = user.isAnonymous
        ? [
            Text(
              translations.account.guestUserLabel,
              style: theme.textTheme.bodyLarge,
            ),
            _GoogleSignInButton(
              onPressed: () async {
                await ref
                    .read(authProvider.notifier)
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
            _SignInMethodChip(user: user),
            if (roles.isNotEmpty)
              Wrap(
                spacing: 4,
                runSpacing: 4,
                alignment: WrapAlignment.center,
                children: roles
                    .map<Widget>(
                      (role) => RawChip(
                        label: Text('ROLE.${role.name}'),
                        backgroundColor: colorScheme.surfaceContainerLow,
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                    .toList(),
              ),
            // プロフィール情報を表示
            if (profileAsync.hasValue && profileAsync.value != null) ...[
              const SizedBox(height: 4),
              ProfileInfoSection(
                profile: profileAsync.value!,
              ),
            ],
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

  String? get signInProvider {
    return identities?.firstOrNull?.provider;
  }
}

/// ログイン方法表示チップ
class _SignInMethodChip extends StatelessWidget {
  const _SignInMethodChip({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = user.signInProvider;

    if (provider == null) {
      return const SizedBox.shrink();
    }

    final (icon, label, color) = switch (provider) {
      'google' => (
        FontAwesomeIcons.google,
        'Google',
        const Color(0xFF4285F4),
      ),
      'apple' => (
        FontAwesomeIcons.apple,
        'Apple',
        theme.brightness == Brightness.dark ? Colors.white : Colors.black,
      ),
      _ => (Icons.account_circle, provider, theme.colorScheme.primary),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          FaIcon(
            icon,
            size: 16,
            color: color,
          ),
          Text(
            '$labelでログイン中',
            style: theme.textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
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
          await ref.read(authProvider.notifier).signOut();
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
class _SectionListItem extends StatelessWidget {
  const _SectionListItem({
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
    final profileAsync = ref.watch(profileProvider);
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
