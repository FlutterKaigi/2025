import 'package:flutterkaigi_2025/components/countdown_view.dart';
import 'package:flutterkaigi_2025/components/external_link.dart';
import 'package:flutterkaigi_2025/config.dart';
import 'package:flutterkaigi_2025/constants/styles.dart';
import 'package:flutterkaigi_2025/text.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

const _tagLineAnimationCurve = 'cubic-bezier(0.64, 0.25, 0.18, 1.22)';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield main_(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(2.rem),
        padding: Padding.all(0.px),
        overflow: Overflow.hidden,
        flex: Flex(grow: 1),
      ),
      [
        const _MainArticle(),
      ],
    );
  }
}

class _MainArticle extends StatelessComponent {
  const _MainArticle();

  static final tagLineWords = event.tagLine.split(' ');

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield article(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
      ),
      [
        h1(
          styles: Styles(
            position: Position.relative(),
            whiteSpace: WhiteSpace.noWrap,
            fontFamily: FontFamily('Lexend'),
            fontWeight: FontWeight.w900,
            textAlign: TextAlign.center,
            margin: Spacing.only(top: 6.rem),
            padding: Padding.symmetric(vertical: 6.rem, horizontal: 8.rem),
            backgroundImage: ImageStyle.url('/img/brush.webp'),
            backgroundSize: BackgroundSize.contain,
            backgroundRepeat: BackgroundRepeat.noRepeat,
          ),
          [
            for (var i = 0; i < tagLineWords.length; i++)
              span(
                styles: Styles(
                  display: Display.block,
                  opacity: 0,
                  transform: Transform.translate(x: 100.vw),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  raw: {
                    'font-size': 'clamp(2.5rem, 6vw, 4.5rem)',
                    'animation-delay': '${i * 0.3}s',
                    'animation-name': 'slide-in',
                    'animation-duration': '0.5s',
                    'animation-timing-function': _tagLineAnimationCurve,
                    'animation-fill-mode': 'forwards',
                  },
                ),
                [text(tagLineWords[i])],
              ),
          ],
        ),
        h2(
          styles: Styles(
            fontSize: 2.rem,
            fontWeight: FontWeight.w900,
            fontFamily: lexendFontFamily,
            margin: Spacing.only(top: 6.rem),
          ),
          [text(event.title)],
        ),
        p(
          styles: Styles(
            fontSize: 1.5.rem,
            fontWeight: FontWeight.w900,
            fontFamily: lexendFontFamily,
            margin: Spacing.only(top: 1.rem),
            textAlign: TextAlign.center,
          ),
          [text('on ${formatDate(event.date, Language.en)}')],
        ),
        p(
          styles: Styles(
            fontSize: 1.5.rem,
            fontWeight: FontWeight.w900,
            fontFamily: lexendFontFamily,
            margin: Spacing.only(top: 2.rem),
            textAlign: TextAlign.center,
          ),
          [
            text('at '),
            ExternalLink(
              content: text(event.place.name.text),
              url: event.place.url,
              styles: Styles(
                fontFamily: lexendFontFamily,
                fontWeight: FontWeight.w900,
                fontSize: 1.5.rem,
                color: Color.inherit,
              ),
            ),
          ],
        ),
        section(
          styles: Styles(
            position: Position.relative(),
            margin: Spacing.only(top: 6.rem),
          ),
          [
            Link(
              to: event.blog.sponsorship.url.text,
              classes: 'gradient-button',
              styles: Styles(
                color: Colors.white,
                cursor: Cursor.pointer,
                fontSize: 1.rem,
              ),
              child: text(event.blog.sponsorship.title.text),
            ),
          ],
        ),
        CountdownView(),
        img(
          src: '/img/flutterkaigi_dash.png',
          alt: 'FlutterKaigi Dash',
          styles: Styles(margin: Spacing.only(top: 2.rem), height: 5.rem),
        ),
      ],
    );
  }
}
