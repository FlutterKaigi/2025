import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';

@client
class Sponsor extends StatefulComponent {
  const Sponsor({
    required this.name,
    required this.logo,
    required this.width,
    required this.pr,
    required this.url,
    required this.snsX,
  });
  final String name;
  final String logo;
  final num width;
  final String pr;
  final String url;
  final String? snsX;

  @override
  State<Sponsor> createState() => _SponsorState();
}

class _SponsorState extends State<Sponsor> {
  Unit get width => component.width.rem;

  Unit get height => width;
  bool isOpen = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      button(
        styles: Styles(
          position: const Position.relative(),
          width: width,
          height: height,
          shadow: BoxShadow(
            offsetX: 2.px,
            offsetY: 2.px,
            blur: 4.px,
            color: const Color.rgba(168, 168, 168, 0.25),
          ),
          cursor: Cursor.pointer,
          color: Colors.transparent,
          backgroundColor: Colors.white,
          backgroundImage: ImageStyle.url(component.logo),
          backgroundPosition: BackgroundPosition.center,
          backgroundRepeat: BackgroundRepeat.noRepeat,
          backgroundSize: BackgroundSize.contain,
        ),
        onClick: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        [
          text(component.name),
        ],
      ),
      dialog(
        open: isOpen,
        styles: Styles(
          display: isOpen ? Display.flex : Display.none,
          position: Position.fixed(top: 0.px, left: 0.px),
          zIndex: const ZIndex(10),
          width: 100.vw,
          height: 100.vh,
          padding: Spacing.all(1.rem),
          boxSizing: BoxSizing.borderBox,
          cursor: Cursor.pointer,
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
          backgroundColor: const Color.rgba(0, 0, 0, 0.5),
        ),
        events: {
          'click': (event) {
            setState(() {
              isOpen = false;
            });
          },
        },
        [
          section(
            styles: Styles(
              display: Display.flex,
              width: 100.percent,
              maxWidth: 960.px,
              padding: Spacing.all(1.rem),
              radius: BorderRadius.circular(1.rem),
              flexDirection: FlexDirection.column,
              alignItems: AlignItems.center,
              gap: Gap.all(1.rem),
              backgroundColor: Colors.white,
            ),
            events: {
              'click': (event) {
                event.stopPropagation();
              },
            },
            [
              img(
                src: component.logo,
                styles: Styles(
                  width: 100.percent,
                  maxWidth: 400.px,
                ),
              ),
              h3(
                styles: Styles(
                  width: 100.percent,
                  fontFamily: lexendFontFamily,
                  fontSize: 1.5.rem,
                  fontWeight: FontWeight.bold,
                ),
                [text(component.name)],
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
                      content: text(component.url),
                      url: component.url,
                    ),
                  ]),
                  if (component.snsX != null)
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
                        content: text('@${component.snsX}'),
                        url: 'https://x.com/${component.snsX}',
                      ),
                    ]),
                ],
              ),
              p(
                styles: Styles(
                  width: 100.percent,
                  whiteSpace: WhiteSpace.preWrap,
                ),
                [text(component.pr)],
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}

class _TypedSponsors extends StatelessComponent {
  const _TypedSponsors(this.type, this.sponsors, {super.key});
  final SponsorType type;
  final Iterable<SponsorInfo> sponsors;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      styles: Styles(
        margin: Margin.only(top: 1.rem),
      ),
      [
        h3(
          styles: Styles(
            display: Display.block,
            textAlign: TextAlign.center,
            fontFamily: lexendFontFamily,
            fontSize: 1.5.rem,
            fontWeight: FontWeight.bold,
          ),
          [text(type.name)],
        ),
        div(
          styles: Styles(
            display: Display.flex,
            margin: Spacing.only(top: 1.rem, bottom: 1.25.rem),
            justifyContent: JustifyContent.center,
          ),
          [
            ul(
              styles: Styles(
                display: Display.flex,
                flexWrap: FlexWrap.wrap,
                justifyContent: JustifyContent.center,
                gap: Gap.all(1.rem),
              ),
              [
                for (final info in sponsors)
                  li([
                    Sponsor(
                      name: info.name,
                      logo: info.logo,
                      url: info.url,
                      pr: info.pr.text(context),
                      snsX: info.sns.x,
                      width: switch (info.type) {
                        SponsorType.platinum => 16,
                        SponsorType.gold => 12,
                        SponsorType.silver => 9,
                        SponsorType.bronze => 9,
                      },
                    ),
                  ]),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Sponsors extends StatelessComponent {
  const Sponsors({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ul(
      styles: const Styles(
        display: Display.grid,
      ),
      [
        _TypedSponsors(
          SponsorType.platinum,
          event.sponsors.where(
            (s) => s.type == SponsorType.platinum && !s.disable,
          ),
        ),
        _TypedSponsors(
          SponsorType.gold,
          event.sponsors.where((s) => s.type == SponsorType.gold && !s.disable),
        ),
        _TypedSponsors(
          SponsorType.silver,
          event.sponsors.where(
            (s) => s.type == SponsorType.silver && !s.disable,
          ),
        ),
        _TypedSponsors(
          SponsorType.bronze,
          event.sponsors.where(
            (s) => s.type == SponsorType.bronze && !s.disable,
          ),
        ),
        p(
          styles: Styles(
            margin: Spacing.only(top: 1.rem),
            textAlign: TextAlign.center,
          ),
          [text('スポンサー募集は締め切りました。多数のご応募ありがとうございました。')],
        ),
      ],
    );
  }
}
