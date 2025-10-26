import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/components/section_layout.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
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
        padding: Padding.all(0.px),
        overflow: Overflow.hidden,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(2.rem),
        flex: const Flex(grow: 1),
      ),
      [
        SectionLayout(
          id: sponsor.slug,
          title: sponsor.name.toComponent,
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
        width: 100.percent,
        maxWidth: 960.px,
        padding: Spacing.all(1.rem),
        radius: BorderRadius.circular(1.rem),
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(1.rem),
      ),
      [
        img(
          src: sponsor.logo,
          styles: Styles(
            width: 100.percent,
            maxWidth: 24.rem,
            backgroundColor: Colors.white,
            shadow: BoxShadow(
              offsetX: 2.px,
              offsetY: 2.px,
              blur: 4.px,
              color: const Color.rgba(168, 168, 168, 0.25),
            ),
          ),
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
