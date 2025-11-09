import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// スタッフメンバーアイテム
class StaffMemberItem extends StatelessWidget {
  const StaffMemberItem({
    required this.staffMember,
    super.key,
  });

  final StaffMemberWithSnsLinks staffMember;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // アイコン・名前・挨拶
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox.square(
                  dimension: 64,
                  child: AccountCircleImage(
                    imageUrl: staffMember.iconUrl,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        staffMember.name,
                        style: textTheme.titleLarge,
                      ),
                      if (staffMember.greeting != null &&
                          staffMember.greeting!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          staffMember.greeting!,
                          style: textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            // SNSアイコン一覧
            if (staffMember.snsLinks.isNotEmpty) ...[
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: staffMember.snsLinks
                    .map(
                      (link) => _SnsIconButton(
                        snsLink: link,
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// SNSアイコンボタン
class _SnsIconButton extends StatelessWidget {
  const _SnsIconButton({
    required this.snsLink,
  });

  final SnsLink snsLink;

  @override
  Widget build(BuildContext context) {
    final snsAsset = _getSnsAsset(snsLink.type);

    return InkWell(
      onTap: () => _onSnsIconTap(snsLink),
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: snsAsset != null
              ? snsAsset.image(
                  fit: BoxFit.contain,
                )
              : Icon(
                  _getSnsIcon(snsLink.type),
                  size: 24,
                ),
        ),
      ),
    );
  }

  Future<void> _onSnsIconTap(SnsLink link) async {
    final url = _getSnsUrl(link.type, link.value);
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  /// SNSタイプに対応するアセットを取得
  /// アセットが存在しない場合はnullを返す
  AssetGenImage? _getSnsAsset(SnsType type) {
    switch (type) {
      case SnsType.github:
        return Assets.res.assets.sns.dark.github;
      case SnsType.x:
        return Assets.res.assets.sns.dark.x;
      case SnsType.discord:
        return Assets.res.assets.sns.dark.discord;
      case SnsType.medium:
        return Assets.res.assets.sns.dark.medium;
      case SnsType.qiita:
        return Assets.res.assets.sns.dark.qiita;
      case SnsType.zenn:
        return Assets.res.assets.sns.dark.zenn;
      case SnsType.note:
        return Assets.res.assets.sns.dark.note;
      case SnsType.other:
        return null;
    }
  }

  /// フォールバック用のアイコン（otherタイプなど、アセットが存在しない場合に使用）
  IconData _getSnsIcon(SnsType type) {
    switch (type) {
      case SnsType.github:
        return Icons.code;
      case SnsType.x:
        return Icons.alternate_email;
      case SnsType.discord:
        return Icons.chat;
      case SnsType.medium:
        return Icons.article;
      case SnsType.qiita:
        return Icons.lightbulb_outline;
      case SnsType.zenn:
        return Icons.menu_book;
      case SnsType.note:
        return Icons.edit_note;
      case SnsType.other:
        return Icons.link;
    }
  }

  String _getSnsUrl(SnsType type, String value) {
    // valueがURL形式の場合はそのまま使用
    if (value.startsWith('http://') || value.startsWith('https://')) {
      return value;
    }

    // SNSタイプに応じてURLを生成
    return switch (type) {
      SnsType.github => 'https://github.com/$value',
      SnsType.x => () {
        // ユーザー名から@を除去
        final username = value.replaceAll('@', '');
        return 'https://x.com/$username';
      }(),
      SnsType.qiita => 'https://qiita.com/$value',
      SnsType.zenn => 'https://zenn.dev/$value',
      SnsType.medium => 'https://medium.com/@$value',
      SnsType.note => 'https://note.com/$value',
      SnsType.discord || SnsType.other => value,
    };
  }
}
