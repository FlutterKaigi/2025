import 'package:flutterkaigi_2025_website/src/components/internal_link.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/path.dart' show Path;
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';

class Header extends StatelessComponent {
  const Header({super.key, this.styles});

  final Styles? styles;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final baseStyles = Styles(
      display: Display.flex,
      zIndex: const ZIndex(10),
      padding: Spacing.all(1.rem),
      flexDirection: FlexDirection.row,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
      raw: {'backdrop-filter': 'blur(10px)'},
    );
    final combined = styles?.combine(baseStyles) ?? baseStyles;

    yield header(styles: combined, [
      div([
        InternalLink(
          content: img(
            src: '/img/icon_flutterkaigi_full_light.svg',
            styles: Styles(
              height: 2.em,
              cursor: Cursor.pointer,
              raw: {
                'vertical-align': 'middle',
              },
            ),
            alt: '${site.title} logo',
          ),
          path: Path.fromPathname(context.url).go(),
        ),
      ]),
      nav(
        styles: Styles(
          display: Display.flex,
          flexDirection: FlexDirection.row,
          alignItems: AlignItems.center,
          gap: Gap(row: 0.5.em, column: 0.5.em),
          fontSize: Unit.inherit,
        ),
        [
          _LanguageLink(
            language: Language.ja,
            title: contents.lang.ja,
          ),
          _LanguageLink(
            language: Language.en,
            title: contents.lang.en,
          ),
        ],
      ),
    ]);
  }
}

class _LanguageLink extends StatelessComponent {
  const _LanguageLink({
    required this.language,
    required this.title,
  });

  final Language language;
  final String title;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final path = Path.fromPathname(context.url);
    if ((path.lang ?? Language.ja) == language) {
      yield Text(title);
      return;
    }
    yield InternalLink(
      content: Text(title),
      path: path.withLang(language),
    );
  }
}
