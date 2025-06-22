import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:flutterkaigi_2025_website/src/constants/theme.dart';
import 'package:jaspr/jaspr.dart';

class Tagline extends StatelessComponent {
  const Tagline({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      styles: Styles(
        position: const Position.relative(),
        width: 100.vw,
        height: 4.rem,
        minWidth: 600.px,
        overflow: Overflow.hidden,
        backgroundColor: beyondRed,
      ),
      [
        div(classes: 'loop', [
          span([text(event.tagLine)]),
          span([text(event.tagLine)]),
        ]),
        div(classes: 'loop loop2', [
          span([text(event.tagLine)]),
          span([text(event.tagLine)]),
        ]),
      ],
    );
  }

  @css
  static final styles = [
    css('.loop', [
      css('& span').styles(
        flex: const Flex(grow: 1),
        color: Colors.white,
        fontFamily: lexendFontFamily,
        fontSize: 1.5.rem,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
      ),
    ]).styles(
      display: Display.flex,
      position: Position.absolute(top: 1.rem, left: 0.px),
      width: 100.percent,
      raw: {'animation': 'loop 20s linear infinite'},
    ),
    css('.loop2').styles(
      raw: {
        'animation-delay': '-10s',
      },
    ),
  ];
}
