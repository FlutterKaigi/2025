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
    return InkWell(
      onTap: () => _onSnsIconTap(snsLink),
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 40,
        height: 40,
        child: _getSnsWidget(snsLink.type),
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

  /// SNSタイプに対応するウィジェットを取得
  Widget _getSnsWidget(SnsType type) {
    return switch (type) {
      SnsType.other => const Icon(
        Icons.link,
        size: 24,
      ),
      // note は画像にパディングがついているため、パディングはつけない
      SnsType.note => Assets.res.assets.sns.dark.note.image(
        fit: BoxFit.contain,
      ),
      _ => () {
        final snsAsset = switch (type) {
          SnsType.github => Assets.res.assets.sns.dark.github,
          SnsType.x => Assets.res.assets.sns.dark.x,
          SnsType.discord => Assets.res.assets.sns.dark.discord,
          SnsType.medium => Assets.res.assets.sns.dark.medium,
          SnsType.qiita => Assets.res.assets.sns.dark.qiita,
          SnsType.zenn => Assets.res.assets.sns.dark.zenn,
          _ => throw StateError('Invalid SNS type: $type'),
        };
        return Padding(
          padding: const EdgeInsets.all(8),
          child: snsAsset.image(fit: BoxFit.contain),
        );
      }(),
    };
  }

  String _getSnsUrl(SnsType type, String value) {
    // SNSタイプに応じてURLを生成
    return switch (type) {
      SnsType.github => 'https://github.com/$value',
      SnsType.x => 'https://x.com/$value',
      SnsType.discord => 'https://discord.com/users/$value',
      SnsType.qiita => 'https://qiita.com/$value',
      SnsType.zenn => 'https://zenn.dev/$value',
      SnsType.medium => 'https://medium.com/@$value',
      SnsType.note => 'https://note.com/$value',
      SnsType.other => value,
    };
  }
}
