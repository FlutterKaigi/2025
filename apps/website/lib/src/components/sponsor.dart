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
    required this.type,
    required this.snsX,
  });
  final String name;
  final String logo;
  final num width;
  final String pr;
  final String url;
  final String type;
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
          padding: Spacing.all(1.5.rem),
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
              maxHeight: 75.vh,
              overflow: const Overflow.only(y: Overflow.auto),
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
            raw: {
              'background': switch (type) {
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
                _ => 'linear-gradient(to bottom, #c4c4c4, #8c8c8c)',
              },
              '-webkit-background-clip': 'text',
              'background-clip': 'text',
              '-webkit-text-fill-color': 'transparent',
            },
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
                      type: info.type.name,
                      snsX: info.sns.x,
                      width: switch (info.type) {
                        SponsorType.platinum => 16,
                        SponsorType.gold => 12,
                        SponsorType.silver => 9,
                        SponsorType.bronze => 9,
                        SponsorType.community => 9,
                        SponsorType.tool => 9,
                        SponsorType.individual => 9,
                        SponsorType.other => 9,
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
    // スポンサータイプごとにグループ化（Basic系を優先順に並べる）
    final sponsorTypes = [
      SponsorType.platinum,
      SponsorType.gold,
      SponsorType.silver,
      SponsorType.bronze,
      SponsorType.community,
      SponsorType.tool,
      SponsorType.other,
    ];

    yield ul(
      styles: const Styles(
        display: Display.grid,
      ),
      [
        for (final type in sponsorTypes)
          () {
            final sponsors = event.sponsors
                .where((s) => s.type == type && !s.disable)
                .toList();
            if (sponsors.isEmpty) {
              return null;
            }
            return _TypedSponsors(type, sponsors);
          }(),
        _IndividualSponsors(event.individualSponsors),
      ].whereType<Component>().toList(),
    );
  }
}

class _IndividualSponsors extends StatelessComponent {
  const _IndividualSponsors(this.data, {super.key});
  final List<IndividualSponsorInfo> data;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield h3(
      styles: Styles(
        display: Display.block,
        margin: Margin.only(top: 1.rem),
        textAlign: TextAlign.center,
        fontFamily: lexendFontFamily,
        fontSize: 1.5.rem,
        fontWeight: FontWeight.bold,
        raw: {
          'background': 'linear-gradient(to bottom, #c4c4c4, #8c8c8c)',
          '-webkit-background-clip': 'text',
          'background-clip': 'text',
          '-webkit-text-fill-color': 'transparent',
        },
      ),
      [text('Individual')],
    );
    yield div(
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
            for (final info in data)
              li([
                img(
                  src: info.logoURL,
                  styles: Styles(
                    width: 6.rem,
                    height: 6.rem,
                    radius: BorderRadius.circular(50.percent),
                    backgroundColor: Colors.white,
                    shadow: BoxShadow(
                      offsetX: 2.px,
                      offsetY: 2.px,
                      blur: 4.px,
                      color: const Color.rgba(168, 168, 168, 0.25),
                    ),
                    overflow: Overflow.hidden,
                  ),
                ),
              ]),
          ],
        ),
      ],
    );
  }
}
