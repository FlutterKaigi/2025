import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:jaspr/jaspr.dart';

@client
class Sponsor extends StatefulComponent {
  const Sponsor({
    required this.name,
    required this.logo,
    required this.width,
  });
  final String name;
  final String logo;
  final num width;

  @override
  State<Sponsor> createState() => _SponsorState();
}

class _SponsorState extends State<Sponsor> {
  Unit get width => component.width.rem;

  Unit get height => width;
  bool onClicked = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button(
      [
        text(component.name),
      ],
      styles: Styles(
        position: const Position.relative(),
        cursor: Cursor.pointer,
        color: onClicked ? Colors.black : Colors.transparent,
        backgroundColor: const Color.rgba(255, 255, 255, 0.6),
        width: width,
        height: height,
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
          onClicked = !onClicked;
        });
      },
    );
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
          event.sponsors.where((s) => s.type == SponsorType.platinum),
        ),
        _TypedSponsors(
          SponsorType.gold,
          event.sponsors.where((s) => s.type == SponsorType.gold),
        ),
        _TypedSponsors(
          SponsorType.silver,
          event.sponsors.where((s) => s.type == SponsorType.silver),
        ),
        _TypedSponsors(
          SponsorType.bronze,
          event.sponsors.where((s) => s.type == SponsorType.bronze),
        ),
      ],
      styles: const Styles(
        display: Display.grid,
      ),
    );
  }
}
