import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield footer(
      styles: Styles(
        display: Display.flex,
        padding: Padding.all(1.rem),
        border: Border.only(
          top: BorderSide.solid(
            color: const Color.variable('--border-color'),
            width: 1.px,
          ),
        ),
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(1.rem),
      ),
      [
        _Navigations(links: event.pastEvents),
        _Navigations(links: site.snsLinks),
        _Navigations(links: site.externalLinks),
        div(
          styles: Styles(
            display: Display.flex,
            flexDirection: FlexDirection.column,
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
            gap: Gap.all(0.5.em),
          ),
          [
            p([
              Text('© ${site.since} - ${site.until} ${site.organizer}'),
            ]),
            p(
              styles: Styles(
                fontSize: 0.8.em,
              ),
              [
                const Text(
                  'Flutter and the related logo are trademarks of Google LLC.'
                  ' FlutterKaigi is not affiliated with or otherwise sponsored'
                  ' by Google LLC.',
                ),
              ],
            ),
            p(
              styles: Styles(
                fontSize: 0.8.em,
              ),
              [
                const Text(
                  'The Flutter name and the Flutter logo ',
                ),
                img(
                  src: '/img/icon_flutter.svg',
                  alt: 'Flutter logo',
                  styles: Styles(
                    height: 0.8.em,
                    raw: {
                      'vertical-align': 'middle',
                    },
                  ),
                ),
                const Text(' are trademarks of Google LLC.'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _Navigations extends StatelessComponent {
  const _Navigations({required this.links});

  final List<LinkBase> links;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield nav(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.row,
        flexWrap: FlexWrap.wrap,
        justifyContent: JustifyContent.center,
        gap: Gap.all(1.em),
      ),
      [
        for (final link in links) _Link(link: link),
      ],
    );
  }
}

class _Link extends StatelessComponent {
  const _Link({required this.link});
  final LinkBase link;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield switch (link) {
      SnsLink(:final title, :final url, :final icon) => div(
        styles: Styles(
          display: Display.flex,
          flexDirection: FlexDirection.row,
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
          gap: Gap.all(0.1.em),
        ),
        [
          img(
            styles: Styles(
              height: 1.5.em,
              raw: {
                'vertical-align': 'middle',
              },
            ),
            src: icon,
            alt: '$title logo',
          ),
          ExternalLink(
            url: url,
            content: Text(title),
          ),
        ],
      ),
      RelatedLink(:final title, :final url) => ExternalLink(
        url: url.text,
        content: Text(title.text),
      ),
      PastEventLink(:final title, :final url) => ExternalLink(
        url: url,
        content: Text(title),
      ),
    };
  }
}
