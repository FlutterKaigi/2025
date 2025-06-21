import 'package:flutterkaigi_2025_website/src/components/countdown_view.dart';
import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/components/schedule_view.dart';
import 'package:flutterkaigi_2025_website/src/components/section_layout.dart';
import 'package:flutterkaigi_2025_website/src/components/sponsor.dart';
import 'package:flutterkaigi_2025_website/src/components/top_event_info.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:flutterkaigi_2025_website/src/constants/theme.dart';
import 'package:flutterkaigi_2025_website/src/pages/call_for_proposal.dart';
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
        const SectionLayout(title: 'Sponsor', children: [Sponsors()]),
        const SectionLayout(
          title: 'Call for Proposal',
          children: [CallForProposal()],
        ),
        const SectionLayout(
          title: 'Timeline',
          children: [Timeline()],
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
        div(
          styles: Styles(
            display: Display.flex,
            padding: Padding.fromLTRB(250.px, 160.px, 270.px, 190.px),
            backgroundImage: const ImageStyle.url(
              '/img/graphic-top-main-no-shadow.svg',
            ),
            backgroundRepeat: BackgroundRepeat.noRepeat,
            backgroundClip: BackgroundClip.borderBox,
            raw: {'filter': 'drop-shadow(4px 32px 0px #EAEAEA)'},
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
                        styles: const Styles(
                          color: Color.inherit,
                        ),
                      ),
                    ),
                  ],
                ),
                div(
                  styles: const Styles(
                    position: Position.relative(),
                  ),
                  [
                    Link(
                      to: event.blog.sponsorship.url.text(context),
                      child: button(
                        classes: 'primary-button primary-button-reverse',
                        styles: Styles(
                          cursor: Cursor.pointer,
                          color: beyondRed,
                          fontSize: 1.rem,
                          fontWeight: FontWeight.bold,
                        ),
                        [
                          event.blog.sponsorship.title
                              .text(context)
                              .toComponent,
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        section(
          styles: Styles(
            position: const Position.relative(),
            margin: Spacing.only(top: 6.rem),
          ),
          [],
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
