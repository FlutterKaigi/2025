import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/account/data/model/profile_share_models.dart';
import 'package:app/features/account/data/notifier/profile_share_notifier.dart';
import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// プロフィールシェア履歴一覧画面
///
/// 主な役割:
/// - シェアしたユーザーのプロフィール一覧を表示
/// - SNSリンクへのアクセス
class ProfileShareListScreen extends HookConsumerWidget {
  const ProfileShareListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendsAsync = ref.watch(profileShareProvider);
    final translations = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(translations.account.profileshare.friendsListScreen.title),
      ),
      body: switch (friendsAsync) {
        AsyncData(:final value) =>
          value.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person_add,
                        size: 64,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        translations
                            .account
                            .profileshare
                            .friendsListScreen
                            .emptyMessage,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final profileWithSns = value[index];
                    return _ProfileShareCard(profileWithSns: profileWithSns);
                  },
                ),
        AsyncLoading() => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        AsyncError(:final error) => ErrorScreen(
          error: error,
          onRetry: () => ref.invalidate(profileShareProvider),
        ),
      },
    );
  }
}

/// 交換履歴カード
class _ProfileShareCard extends StatelessWidget {
  const _ProfileShareCard({required this.profileWithSns});

  final ProfileWithSns profileWithSns;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleMedium;
    final snsTextStyle = titleStyle?.copyWith(
      fontWeight: FontWeight.bold,
    );

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.dividerColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // アバター画像
            if (profileWithSns.profile.avatarUrl != null)
              AccountCircleImage(
                imageUrl: profileWithSns.profile.avatarUrl.toString(),
                circleRadius: 24,
                imageSize: 48,
                errorIconSize: 24,
              )
            else
              CircleAvatar(
                radius: 24,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                child: Icon(
                  Icons.person,
                  size: 24,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            const SizedBox(width: 16),
            // 名前とSNS情報
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ユーザー名
                  Text(
                    profileWithSns.profile.name,
                    style: titleStyle,
                  ),
                  const SizedBox(height: 8),
                  // SNSリンク
                  if (profileWithSns.snsLinks.isEmpty)
                    Text(
                      Translations.of(context).account.profile.sns.notLinked,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    )
                  else
                    ...profileWithSns.snsLinks.map((link) {
                      final canLaunch =
                          link.snsType != SnsType.discord &&
                          link.snsType != SnsType.other;
                      return InkWell(
                        onTap: () async {
                          if (canLaunch) {
                            // リンクを開く
                            final url = _getSnsUrl(link.snsType, link.value);
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(
                                Uri.parse(url),
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          } else {
                            // クリップボードにコピー
                            await Clipboard.setData(
                              ClipboardData(text: link.value),
                            );
                            if (context.mounted) {
                              final t = Translations.of(context);
                              final copiedText = t
                                  .account
                                  .profileshare
                                  .friendsListScreen
                                  .copiedToClipboard;
                              final message = '${link.value} $copiedText';
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(message),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            children: [
                              FaIcon(
                                _getSnsIcon(link.snsType),
                                size: snsTextStyle?.fontSize,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _formatSnsValue(link.snsType, link.value),
                                  style: snsTextStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (!canLaunch) ...[
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.copy,
                                  size: snsTextStyle?.fontSize,
                                  color: Colors.grey,
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getSnsIcon(SnsType type) {
    return switch (type) {
      SnsType.github => FontAwesomeIcons.github,
      SnsType.x => FontAwesomeIcons.xTwitter,
      SnsType.discord => FontAwesomeIcons.discord,
      SnsType.medium => FontAwesomeIcons.medium,
      SnsType.qiita => FontAwesomeIcons.link,
      SnsType.zenn => FontAwesomeIcons.link,
      SnsType.note => FontAwesomeIcons.link,
      SnsType.other => FontAwesomeIcons.link,
    };
  }

  String _formatSnsValue(SnsType type, String value) {
    // URL形式の場合はそのまま、そうでない場合は@を付ける
    if (value.startsWith('http')) {
      return value;
    }
    return '@$value';
  }

  String _getSnsUrl(SnsType type, String value) {
    return switch (type) {
      SnsType.github => 'https://github.com/$value',
      SnsType.x => 'https://x.com/$value',
      SnsType.qiita => 'https://qiita.com/$value',
      SnsType.zenn => 'https://zenn.dev/$value',
      SnsType.medium => 'https://medium.com/@$value',
      SnsType.note => 'https://note.com/$value',
      SnsType.discord || SnsType.other => value,
    };
  }
}
