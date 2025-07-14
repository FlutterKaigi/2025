import 'package:dashboard/core/gen/l10n/l10n.dart';
import 'package:dashboard/core/provider/environment.dart';
import 'package:dashboard/features/account/ui/component/account_circle_image.dart';
import 'package:dashboard/features/account/ui/component/account_scaffold.dart';
import 'package:dashboard/features/account/ui/info/component/account_invitation_dialog.dart';
import 'package:dashboard/features/account/ui/info/component/account_other_list.dart';
import 'package:dashboard/features/auth/data/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final class AccountInfoScreen extends ConsumerWidget
    with _AccountInfoScreenMixin {
  const AccountInfoScreen({
    required VoidCallback onProfileEdit,
    super.key,
  }) : _onProfileEdit = onProfileEdit;

  final VoidCallback _onProfileEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authNotifierProvider);
    final isJapanese = Localizations.localeOf(context).languageCode == 'ja';

    return AccountScaffold(
      body: state.when(
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (user) => Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // TODO(YumNumm): Repository層でパースする
                    if (user?.userMetadata?['avatar_url'] != null)
                      AccountCircleImage(
                        imageUrl: user!.userMetadata!['avatar_url'].toString(),
                      ),
                    const SizedBox(height: 16),
                    Text(
                      user?.email ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          // TODO: ユースケースから取得した情報を表示する
                          [
                                'Sponsor',
                                'Google',
                              ]
                              .map(
                                (text) => Chip(
                                  label: Text(
                                    text,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _onProfileEdit,
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
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          await showDialog<bool?>(
                            useRootNavigator: false,
                            context: context,
                            builder: (context) => AccountInvitationDialog(
                              onCancel: () => Navigator.of(context).pop(),
                              onFailure: () => Navigator.of(context).pop(false),
                              onSuccess: () => Navigator.of(context).pop(true),
                            ),
                          ).then((value) {
                            if (context.mounted && value != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    value
                                        ? L10n.of(
                                            context,
                                          ).accountInvitationCodeApplied
                                        : L10n.of(
                                            context,
                                          ).accountInvitationCodeApplyFailed,
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                          });
                        },
                        icon: const Icon(Icons.card_giftcard),
                        label: Text(
                          L10n.of(context).accountInvitationCodeInput,
                        ),
                        style: OutlinedButton.styleFrom(
                          visualDensity: VisualDensity.comfortable,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                L10n.of(context).accountOthers,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: AccountOtherList(
                items: [
                  (
                    title: L10n.of(context).accountCodeOfConduct,
                    onTap: () => openUrl(
                      urlString: isJapanese
                          ? 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja'
                          : 'https://docs.flutterkaigi.jp/Code-of-Conduct',
                    ),
                  ),
                  (
                    title: L10n.of(context).accountPrivacyPolicy,
                    onTap: () => openUrl(
                      urlString: isJapanese
                          ? 'https://docs.flutterkaigi.jp/Privacy-Policy.ja'
                          : 'https://docs.flutterkaigi.jp/Privacy-Policy',
                    ),
                  ),
                  (
                    title: L10n.of(context).accountContact,
                    onTap: () => openUrl(
                      urlString:
                          'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform',
                    ),
                  ),
                  (
                    title: L10n.of(context).accountOssLicenses,
                    onTap: () => showLicensePage(
                      context: context,
                      applicationName: ref.read(
                        environmentProvider.select(
                          (env) => env.appName,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

mixin _AccountInfoScreenMixin {
  Future<void> openUrl({required String urlString}) async {
    final uri = Uri.tryParse(urlString);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch $urlString');
    }
  }
}
