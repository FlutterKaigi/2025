import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// プロフィール情報表示セクション
///
/// プロフィール名とSNSリンクを表示する共通コンポーネント
class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({
    required this.profile,
    super.key,
  });

  final ProfileResponse profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                size: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  profile.profile.name,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          if (profile.snsLinks.isNotEmpty) ...[
            const Divider(height: 1),
            ...profile.snsLinks.map(
              (link) => Row(
                children: [
                  FaIcon(
                    _getSnsIcon(link.snsType),
                    size: 14,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _formatSnsValue(link.snsType, link.value),
                      style: textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
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
    if (value.startsWith('http')) {
      return value;
    }
    return '@$value';
  }
}
