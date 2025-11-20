import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// SNSリンクを表示するカードコンポーネント
class SnsLinkCard extends StatelessWidget {
  const SnsLinkCard({
    required this.snsAccount,
    super.key,
  });

  final SnsLink snsAccount;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        leading: Icon(
          _getSnsIcon(snsAccount.snsType),
          color: _getSnsColor(snsAccount.snsType, colorScheme),
        ),
        title: Text(_getSnsTypeDisplayName(snsAccount.snsType, t)),
        subtitle: Text(
          snsAccount.value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.open_in_new),
        onTap: () => _launchUrl(Uri.parse(snsAccount.value)),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

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

  Color _getSnsColor(SnsType type, ColorScheme colorScheme) {
    // Material Design カラーを使用
    switch (type) {
      case SnsType.github:
        return const Color(0xFF24292e);
      case SnsType.x:
        return const Color(0xFF1DA1F2);
      case SnsType.discord:
        return const Color(0xFF7289DA);
      case SnsType.medium:
        return const Color(0xFF00AB6C);
      case SnsType.qiita:
        return const Color(0xFF55C500);
      case SnsType.zenn:
        return const Color(0xFF3EA8FF);
      case SnsType.note:
        return const Color(0xFF41C9B4);
      case SnsType.other:
        return colorScheme.primary;
    }
  }

  String _getSnsTypeDisplayName(SnsType type, Translations t) {
    switch (type) {
      case SnsType.github:
        return t.account.profile.sns.displayNames.github;
      case SnsType.x:
        return t.account.profile.sns.displayNames.x;
      case SnsType.discord:
        return t.account.profile.sns.displayNames.discord;
      case SnsType.medium:
        return t.account.profile.sns.displayNames.medium;
      case SnsType.qiita:
        return t.account.profile.sns.displayNames.qiita;
      case SnsType.zenn:
        return t.account.profile.sns.displayNames.zenn;
      case SnsType.note:
        return t.account.profile.sns.displayNames.note;
      case SnsType.other:
        return t.account.profile.sns.other;
    }
  }
}

/// SNSリンクリスト表示用ウィジェット
class SnsLinksList extends StatelessWidget {
  const SnsLinksList({
    required this.snsLinks,
    super.key,
  });

  final List<SnsLink> snsLinks;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    if (snsLinks.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(t.account.profile.sns.notLinked),
          ),
        ),
      );
    }

    return Column(
      children: snsLinks
          .map(
            (link) => SnsLinkCard(
              snsAccount: SnsLink(snsType: link.snsType, value: link.value),
            ),
          )
          .toList(),
    );
  }
}
