import 'package:flutterkaigi_2025_website/src/components/countdown_view.dart';
import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/components/schedule_view.dart';
import 'package:flutterkaigi_2025_website/src/components/section_layout.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:flutterkaigi_2025_website/src/pages/call_for_proposal.dart';
import 'package:flutterkaigi_2025_website/src/pages/staff.dart';
import 'package:flutterkaigi_2025_website/text.dart';
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
        padding: Padding.all(0.px),
        overflow: Overflow.hidden,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(2.rem),
        flex: const Flex(grow: 1),
      ),
      [
        const _MainArticle(),
        SectionLayout(title: 'Schedule', children: [ScheduleView()]),
        const SectionLayout(
          title: 'Call for Proposal',
          children: [CallForProposal()],
        ),
        const SectionLayout(
          title: 'Staffs',
          children: [Staff()],
        ),
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
      styles: const Styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
      ),
      [
        h1(
          styles: Styles(
            position: const Position.relative(),
            padding: Padding.symmetric(vertical: 6.rem, horizontal: 8.rem),
            margin: Spacing.only(top: 6.rem),
            textAlign: TextAlign.center,
            fontFamily: const FontFamily('Lexend'),
            fontWeight: FontWeight.w900,
            whiteSpace: WhiteSpace.noWrap,
            backgroundImage: const ImageStyle.url('/img/brush.webp'),
            backgroundRepeat: BackgroundRepeat.noRepeat,
            backgroundSize: BackgroundSize.contain,
          ),
          [
            for (var i = 0; i < tagLineWords.length; i++)
              span(
                styles: Styles(
                  display: Display.block,
                  opacity: 0,
                  transform: Transform.translate(x: 100.vw),
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
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
            margin: Spacing.only(top: 6.rem),
            fontFamily: lexendFontFamily,
            fontSize: 2.rem,
            fontWeight: FontWeight.w900,
          ),
          [text(event.title)],
        ),
        p(
          styles: Styles(
            margin: Spacing.only(top: 1.rem),
            textAlign: TextAlign.center,
            fontFamily: lexendFontFamily,
            fontSize: 1.5.rem,
            fontWeight: FontWeight.w900,
          ),
          [text('on ${formatDate(context, event.date, Language.en)}')],
        ),
        p(
          styles: Styles(
            margin: Spacing.only(top: 2.rem),
            textAlign: TextAlign.center,
            fontFamily: lexendFontFamily,
            fontSize: 1.5.rem,
            fontWeight: FontWeight.w900,
          ),
          [
            text('at '),
            ExternalLink(
              content: event.place.name.text(context).toComponent,
              url: event.place.url,
              styles: Styles(
                color: Color.inherit,
                fontFamily: lexendFontFamily,
                fontSize: 1.5.rem,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        section(
          styles: Styles(
            position: const Position.relative(),
            margin: Spacing.only(top: 6.rem),
          ),
          [
            Link(
              to: event.blog.sponsorship.url.text(context),
              classes: 'gradient-button',
              styles: Styles(
                cursor: Cursor.pointer,
                color: Colors.white,
                fontSize: 1.rem,
              ),
              child: event.blog.sponsorship.title.text(context).toComponent,
            ),
          ],
        ),
        CountdownView(),
        img(
          src: '/img/flutterkaigi_dash.png',
          alt: 'FlutterKaigi Dash',
          styles: Styles(
            height: 5.rem,
            margin: Spacing.only(top: 2.rem),
          ),
        ),
      ],
    );
  }
}
