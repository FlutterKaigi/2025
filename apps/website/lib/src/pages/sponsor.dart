import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/components/section_layout.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';

class Sponsor extends StatelessComponent {
  const Sponsor(this.sponsor, {super.key});
  final SponsorInfo sponsor;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield main_(
      classes: 'main-background',
      styles: Styles(
        display: Display.flex,
        position: const Position.relative(),
        padding: Padding.symmetric(horizontal: 32.px),
        boxSizing: BoxSizing.borderBox,
        width: 100.percent,
        overflow: Overflow.hidden,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(2.rem),
        flex: const Flex(grow: 1),
      ),
      [
        SectionLayout(
          id: sponsor.slug,
          title: span(
            ['${sponsor.type.name} Sponsor'.toComponent],
            styles: Styles(
              raw: {
                'background': switch (sponsor.type) {
                  SponsorType.platinum =>
                    'linear-gradient(to bottom, #b7dce1, #6bb5c2)',
                  SponsorType.gold =>
                    'linear-gradient(to bottom, #ebd9a3, #daba58)',
                  SponsorType.silver =>
                    'linear-gradient(to bottom, #d6d7d7, #909c9e)',
                  SponsorType.bronze =>
                    'linear-gradient(to bottom, #bb967a, #946a4a)',
                  SponsorType.community =>
                    'linear-gradient(to bottom, #a8d8ea, #6ca6cd)',
                  SponsorType.tool =>
                    'linear-gradient(to bottom, #d4a5d4, #a77ba7)',
                  SponsorType.other =>
                    'linear-gradient(to bottom, #c4c4c4, #8c8c8c)',
                },
                '-webkit-background-clip': 'text',
                'background-clip': 'text',
                'font-family': 'inherit',
                'font-weight': 'inherit',
                'font-size': 'inherit',
                '-webkit-text-fill-color': 'transparent',
              },
            ),
          ),
          children: [
            _SponsorIntro(sponsor),
          ],
        ),
      ],
    );
  }
}

class _SponsorIntro extends StatelessComponent {
  const _SponsorIntro(this.sponsor, {super.key});
  final SponsorInfo sponsor;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      styles: Styles(
        display: Display.flex,
        maxWidth: 960.px,
        padding: Spacing.all(1.rem),
        radius: BorderRadius.circular(1.rem),
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(1.rem),
        backgroundColor: Colors.white,
      ),
      [
        img(
          src: sponsor.logo,
          styles: Styles(
            width: 100.percent,
            maxWidth: 24.rem,
            backgroundColor: Colors.white,
          ),
        ),
        h3(
          styles: Styles(
            width: 100.percent,
            fontFamily: lexendFontFamily,
            fontSize: 1.5.rem,
            fontWeight: FontWeight.bold,
          ),
          [sponsor.name.toComponent],
        ),
        ul(
          styles: Styles(
            display: Display.flex,
            width: 100.percent,
            padding: Padding.zero,
            margin: Margin.zero,
            flexDirection: FlexDirection.row,
            flexWrap: FlexWrap.wrap,
            alignItems: AlignItems.center,
            gap: Gap.all(1.em),
            listStyle: ListStyle.none,
          ),
          [
            li([
              ExternalLink(
                content: text(sponsor.url),
                url: sponsor.url,
              ),
            ]),
            if (sponsor.sns.x != null)
              li([
                img(
                  src: '/img/icon_sns_x.svg',
                  alt: 'X logo',
                  styles: Styles(
                    height: 1.2.em,
                    raw: {
                      'vertical-align': 'middle',
                    },
                  ),
                ),
                text(' '),
                ExternalLink(
                  content: text('@${sponsor.sns.x}'),
                  url: 'https://x.com/${sponsor.sns.x}',
                ),
              ]),
          ],
        ),
        p([sponsor.pr.text(context).toComponent]),
      ],
    );
  }
}
