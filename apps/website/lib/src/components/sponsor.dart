import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
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
  });
  final String name;
  final String logo;
  final num width;
  final String pr;
  final String url;

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
        [
          text(component.name),
        ],
        styles: Styles(
          position: const Position.relative(),
          cursor: Cursor.pointer,
          width: width,
          height: height,
          color: Colors.transparent,
          backgroundColor: const Color.rgba(255, 255, 255, 0.6),
          shadow: BoxShadow(
            offsetX: 0.5.rem,
            offsetY: 0.5.rem,
            blur: 1.rem,
            color: const Color.rgba(0, 0, 0, 0.1),
          ),
          backgroundImage: ImageStyle.url(component.logo),
          backgroundSize: BackgroundSize.cover,
        ),
        onClick: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
      ),
      dialog(
        [
          section(
            [
              img(
                src: component.logo,
                styles: Styles(
                  width: 100.percent,
                  maxWidth: 400.px,
                ),
              ),
              h3(
                [text(component.name)],
                styles: Styles(
                  fontFamily: const FontFamily('Lexend'),
                  fontSize: 1.5.rem,
                  fontWeight: FontWeight.bold,
                  width: 100.percent,
                ),
              ),
              p(
                [
                  ExternalLink(
                    content: text(component.url),
                    url: component.url,
                  ),
                ],
                styles: Styles(
                  width: 100.percent,
                ),
              ),
              p(
                [text(component.pr)],
                styles: Styles(
                  width: 100.percent,
                ),
              ),
            ],
            styles: Styles(
              display: Display.flex,
              gap: Gap.all(1.rem),
              padding: Spacing.all(1.rem),
              backgroundColor: Colors.white,
              radius: BorderRadius.circular(1.rem),
              flexDirection: FlexDirection.column,
              alignItems: AlignItems.center,
              width: 100.percent,
              maxWidth: 960.px,
            ),
            events: {
              'click': (event) {
                event.stopPropagation();
              },
            },
          ),
        ],
        open: isOpen,
        styles: Styles(
          position: Position.fixed(top: 0.px, left: 0.px),
          backgroundColor: const Color.rgba(0, 0, 0, 0.5),
          zIndex: const ZIndex(10),
          height: 100.vh,
          width: 100.vw,
          display: isOpen ? Display.flex : Display.none,
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
          cursor: Cursor.pointer,
          padding: Spacing.all(1.rem),
          boxSizing: BoxSizing.borderBox,
        ),
        events: {
          'click': (event) {
            setState(() {
              isOpen = false;
            });
          },
        },
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
    yield div([
      h3(
        [text(type.name)],
        styles: Styles(
          display: Display.block,
          fontFamily: const FontFamily('Lexend'),
          fontSize: 1.2.rem,
          fontWeight: FontWeight.bold,
        ),
      ),
      div(
        [
          ul(
            sponsors
                .map(
                  (info) => li([
                    Sponsor(
                      name: info.name,
                      logo: info.logo,
                      url: info.url,
                      pr: info.pr.text(context),
                      width: switch (info.type) {
                        SponsorType.platinum => 16,
                        SponsorType.gold => 12,
                        SponsorType.silver => 9,
                        SponsorType.bronze => 9,
                      },
                    ),
                  ]),
                )
                .toList(),
            styles: Styles(
              display: Display.flex,
              justifyContent: JustifyContent.start,
              flexWrap: FlexWrap.wrap,
              gap: Gap.all(1.rem),
            ),
          ),
        ],
        styles: Styles(
          display: Display.flex,
          justifyContent: JustifyContent.center,
          margin: Spacing.only(top: 1.rem),
        ),
      ),
    ]);
  }
}

class Sponsors extends StatelessComponent {
  const Sponsors({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ul(
      [
        _TypedSponsors(
          SponsorType.platinum,
          event.sponsors.where((s) => s.type == SponsorType.platinum && !s.disable),
        ),
        _TypedSponsors(
          SponsorType.gold,
          event.sponsors.where((s) => s.type == SponsorType.gold && !s.disable),
        ),
        _TypedSponsors(
          SponsorType.silver,
          event.sponsors.where((s) => s.type == SponsorType.silver && !s.disable),
        ),
        _TypedSponsors(
          SponsorType.bronze,
          event.sponsors.where((s) => s.type == SponsorType.bronze && !s.disable),
        ),
      ],
      styles: const Styles(
        display: Display.grid,
      ),
    );
  }
}
