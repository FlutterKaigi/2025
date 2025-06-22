import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:jaspr/jaspr.dart';

class StaffCard extends StatelessComponent {
  const StaffCard({
    required this.info,
    super.key,
  });

  final StaffInfo info;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final snsLinks = _buildSnsLinks();

    yield div(
      styles: Styles(
        display: Display.flex,
        width: 100.px,
        padding: Spacing.all(1.rem),
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
      ),
      [
        div(
          styles: Styles(
            display: Display.flex,
            width: 72.px,
            height: 72.px,
            margin: Spacing.only(bottom: 1.rem),
            radius: BorderRadius.all(Radius.circular(50.px)),
            overflow: Overflow.hidden,
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
            backgroundColor: const Color.rgba(200, 200, 200, 0.3),
          ),
          [
            img(
              src: info.avatar,
              alt: 'Staff photo: ${info.name}',
              styles: Styles(
                maxWidth: 100.px,
                maxHeight: 100.px,
              ),
            ),
          ],
        ),
        p(
          styles: Styles(
            margin: Spacing.only(bottom: 0.5.rem),
            textAlign: TextAlign.center,
            fontSize: 1.rem,
            fontWeight: FontWeight.w400,
            lineHeight: 2.rem,
          ),
          [
            Text(info.name),
          ],
        ),
        if (snsLinks.isNotEmpty)
          ul(
            snsLinks,
            styles: Styles(
              display: Display.flex,
              padding: Padding.zero,
              margin: Margin.zero,
              flexDirection: FlexDirection.row,
              flexWrap: FlexWrap.wrap,
              justifyContent: JustifyContent.center,
              gap: Gap.all(0.5.em),
              listStyle: ListStyle.none,
            ),
          ),
        p(
          styles: Styles(
            fontSize: 0.8.rem,
            lineHeight: 1.4.rem,
          ),
          [
            Text(info.comment),
          ],
        ),
      ],
    );
  }

  List<Component> _buildSnsLinks() {
    final sns = info.sns;

    return [
      if (sns.x != null)
        _buildSnsLink(
          icon: '/img/icon_sns_x.svg',
          alt: 'X',
          url: 'https://x.com/${sns.x}',
        ),
      // if (sns.bluesky != null)
      //   _buildSnsLink(
      //     icon: '/img/icon_sns_bluesky.svg',
      //     alt: 'Bluesky',
      //     url: 'https://bsky.app/profile/${sns.bluesky}',
      //   ),
      // if (sns.mixi2 != null)
      //   _buildSnsLink(
      //     icon: '/img/icon_sns_mixi2.svg',
      //     alt: 'mixi2',
      //     url: 'https://mixi.jp/${sns.mixi2}',
      //   ),
      if (sns.medium != null)
        _buildSnsLink(
          icon: '/img/icon_sns_medium.svg',
          alt: 'Medium',
          url: 'https://medium.com/@${sns.medium}',
        ),
      // if (sns.qiita != null)
      //   _buildSnsLink(
      //     icon: '/img/icon/qiita.svg',
      //     alt: 'Qiita',
      //     url: 'https://qiita.com/${sns.qiita}',
      //   ),
      // if (sns.zenn != null)
      //   _buildSnsLink(
      //     icon: '/img/icon_sns_zenn.svg',
      //     alt: 'Zenn',
      //     url: 'https://zenn.dev/${sns.zenn}',
      //   ),
      if (sns.note != null)
        _buildSnsLink(
          icon: '/img/icon/note.svg',
          alt: 'note',
          url: 'https://note.com/${sns.note}',
        ),
      if (sns.website != null)
        _buildSnsLink(
          icon: '/img/icon/link.svg',
          alt: 'Website',
          url: sns.website!,
        ),
    ];
  }

  Component _buildSnsLink({
    required String icon,
    required String alt,
    required String url,
  }) {
    return li([
      ExternalLink(
        url: url,
        content: img(
          src: icon,
          alt: alt,
          styles: Styles(
            width: 1.5.em,
            height: 1.5.em,
            cursor: Cursor.pointer,
          ),
        ),
      ),
    ]);
  }
}
