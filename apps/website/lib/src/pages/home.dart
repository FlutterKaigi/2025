import 'package:flutterkaigi_2025_website/src/components/countdown_view.dart';
import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/components/open_in_new.dart';
import 'package:flutterkaigi_2025_website/src/components/section_layout.dart';
import 'package:flutterkaigi_2025_website/src/components/sized_dashsay.dart';
import 'package:flutterkaigi_2025_website/src/components/sponsor.dart';
import 'package:flutterkaigi_2025_website/src/components/tagline.dart';
import 'package:flutterkaigi_2025_website/src/components/top_event_info.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:flutterkaigi_2025_website/src/constants/theme.dart';
import 'package:flutterkaigi_2025_website/src/pages/news.dart';
import 'package:flutterkaigi_2025_website/src/pages/staff.dart';
import 'package:flutterkaigi_2025_website/src/pages/timeline.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class Home extends StatelessComponent {
  const Home({super.key});

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
        const _MainArticle(),
        const SectionLayout(title: 'News', children: [News()]),
        // const SectionLayout(
        //   title: 'Call for Proposal',
        //   children: [CallForProposal()],
        // ),
        SizedDashsay(
          message: contents.dayZeroPlanning.text(context),
          isBold: true,
          fontSize: 1.25.rem,
          dashSize: 8.rem,
        ),
        const Tagline(),
        const SectionLayout(
          title: 'Timeline',
          children: [Timeline()],
        ),
        const SectionLayout(
          title: 'Sponsor',
          children: [Sponsors()],
        ),
        const SectionLayout(
          title: 'Staff',
          children: [Staff()],
        ),
        CountdownView(),
      ],
    );
  }
}

class _MainArticle extends StatelessComponent {
  const _MainArticle();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield article(
      styles: Styles(
        display: Display.flex,
        margin: Margin.only(top: 2.rem),
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
      ),
      [
        div(
          styles: Styles(
            display: Display.flex,
            position: Position.absolute(
              top: const Unit.expression('calc(65px + 2rem)'),
              left: 0.px,
              right: 0.px,
            ),
            width: 100.percent,
            padding: Padding.only(bottom: 32.px),
            overflow: Overflow.hidden,
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
          ),
          [
            img(src: '/img/graphic-top-sub.svg'),
            div(
              styles: Styles(
                display: Display.flex,
                padding: Padding.fromLTRB(250.px, 160.px, 270.px, 190.px),
                backgroundImage: const ImageStyle.url(
                  '/img/graphic-top-main.svg',
                ),
                backgroundPosition: BackgroundPosition.initial,
                backgroundRepeat: BackgroundRepeat.noRepeat,
                raw: {'filter': 'drop-shadow(4px 32px 0px #EAEAEA)'},
              ),
              [
                div(
                  styles: Styles(width: 350.px, height: 240.px),
                  [],
                ),
              ],
            ),
            img(src: '/img/graphic-top-sub.svg'),
          ],
        ),
        div(
          styles: Styles(
            display: Display.flex,
            zIndex: const ZIndex(2),
            padding: Padding.fromLTRB(250.px, 160.px, 270.px, 190.px),
          ),
          [
            div(
              styles: Styles(
                display: Display.flex,
                width: 350.px,
                height: 240.px,
                flexDirection: FlexDirection.column,
                justifyContent: JustifyContent.center,
                alignItems: AlignItems.center,
                gap: Gap.all(1.rem),
              ),
              [
                h1(
                  styles: Styles(
                    color: Colors.white,
                    fontFamily: lexendFontFamily,
                    fontSize: 2.rem,
                    fontWeight: FontWeight.bold,
                  ),
                  [text(event.title)],
                ),
                div(
                  styles: const Styles(
                    display: Display.flex,
                    flexDirection: FlexDirection.column,
                    alignItems: AlignItems.center,
                  ),
                  [
                    TopEventInfo(
                      iconPath: '/img/icon/event.svg',
                      contents: text(
                        formatDate(context, event.date, Language.en),
                      ),
                    ),
                    TopEventInfo(
                      iconPath: '/img/icon/map.svg',
                      contents: ExternalLink(
                        content: event.place.name.text(context).toComponent,
                        url: event.place.url,
                        styles: const Styles(color: Color.inherit),
                      ),
                    ),
                    Link(
                      to: event.tickets.url,
                      target: Target.blank,
                      styles: Styles(margin: Margin.only(top: 2.rem)),
                      child: button(
                        styles: Styles(
                          display: Display.flex,
                          position: const Position.relative(),
                          cursor: Cursor.pointer,
                          justifyContent: JustifyContent.center,
                          gap: Gap.all(1.rem),
                          color: beyondRed,
                          fontSize: 1.rem,
                        ),
                        classes: 'primary-button primary-button-reverse',
                        [
                          event.tickets.title.text(context).toComponent,
                          const OpenInNew(color: beyondRed),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
