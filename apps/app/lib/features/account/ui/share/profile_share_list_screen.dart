import 'dart:async';

import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/util/let.dart';
import 'package:app/features/account/data/model/profile_share_models.dart';
import 'package:app/features/account/data/notifier/profile_share_notifier.dart';
import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:app/features/websocket/data/provider/websocket_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
        actions: [
          IconButton(
            onPressed: () => ref.invalidate(profileShareProvider),
            icon: const Icon(Icons.refresh),
          ),
        ],
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
              : RefreshIndicator.adaptive(
                  onRefresh: () async =>
                      ref.refresh(profileShareProvider.future),
                  child: Column(
                    children: [
                      const _WebSocketStatus(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            final profileWithSns = value[index];
                            return _ProfileShareCard(
                              profileWithSns: profileWithSns,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleMedium;
    final snsTextStyle = titleStyle?.copyWith();

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
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: profileWithSns.snsLinks.map((link) {
                        final icon = switch (link.snsType) {
                          SnsType.github => FontAwesomeIcons.github,
                          SnsType.x => FontAwesomeIcons.xTwitter,
                          SnsType.discord => FontAwesomeIcons.discord,
                          SnsType.medium => FontAwesomeIcons.medium,
                          SnsType.qiita => FontAwesomeIcons.link,
                          SnsType.zenn => FontAwesomeIcons.link,
                          SnsType.note => FontAwesomeIcons.link,
                          SnsType.other => FontAwesomeIcons.link,
                        };

                        final uri = switch (link.snsType) {
                          SnsType.github => 'https://github.com/${link.value}',
                          SnsType.x => 'https://x.com/${link.value}',
                          SnsType.qiita => 'https://qiita.com/${link.value}',
                          SnsType.zenn => 'https://zenn.dev/${link.value}',
                          SnsType.medium => 'https://medium.com/@${link.value}',
                          SnsType.note => 'https://note.com/${link.value}',
                          SnsType.discord => null,
                          SnsType.other when link.value.startsWith('http') =>
                            link.value,
                          SnsType.other => null,
                        }?.let(Uri.parse);

                        return InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () async {
                            if (uri != null) {
                              // リンクを開く
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                                return;
                              }
                            } else {
                              // クリップボードにコピー
                              await Clipboard.setData(
                                ClipboardData(text: link.value),
                              );
                              if (context.mounted) {
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
                            padding: const EdgeInsets.all(2),
                            child: Row(
                              children: [
                                FaIcon(
                                  icon,
                                  size: snsTextStyle?.fontSize,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    // URL形式の場合はそのまま、そうでない場合は@を付ける
                                    link.value.startsWith('http')
                                        ? link.value
                                        : '@${link.value}',
                                    style: snsTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
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

class _WebSocketStatus extends HookConsumerWidget {
  const _WebSocketStatus();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final websocketError = ref.watch(
      websocketStreamProvider.select((v) => v.error),
    );
    final theme = Theme.of(context);
    final isConnecting = ref.watch(
      websocketChannelProvider.select((v) => v.isLoading),
    );
    useEffect(() {
      final reconnectTimer = Timer.periodic(const Duration(seconds: 10), (
        timer,
      ) {
        if (websocketError == null) {
          return;
        }
        ref.invalidate(websocketChannelProvider);
        ref.invalidate(profileShareProvider);
      });
      return reconnectTimer.cancel;
    }, []);
    
    if (websocketError != null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: theme.colorScheme.errorContainer,
        child: Row(
          children: [
            Icon(Icons.error_outline, size: 16, color: theme.colorScheme.error),
          ],
        ),
      );
    }

    if (isConnecting) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: theme.colorScheme.surfaceContainerHighest,
        child: Row(
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
