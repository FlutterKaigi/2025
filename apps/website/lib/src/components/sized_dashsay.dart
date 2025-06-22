import 'package:jaspr/jaspr.dart';

class SizedDashsay extends StatelessComponent {
  const SizedDashsay({
    required this.message,
    this.isBold = false,
    this.fontSize,
    this.dashSize,
    super.key,
  });

  final String message;
  final bool isBold;
  final Unit? fontSize;
  final Unit? dashSize;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      styles: const Styles(
        display: Display.flex,
        flexDirection: FlexDirection.row,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
        flex: Flex(grow: 1),
      ),
      [
        p(
          styles: Styles(
            padding: Padding.symmetric(vertical: 0.75.rem, horizontal: 1.5.rem),
            border: const Border(color: Color.variable('--border-color')),
            radius: BorderRadius.only(
              topLeft: Radius.circular(1.rem),
              topRight: Radius.circular(1.rem),
              bottomRight: Radius.circular(0.rem),
              bottomLeft: Radius.circular(1.rem),
            ),
            fontSize: fontSize ?? 1.5.rem,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
          [text(message)],
        ),
        img(
          styles: Styles(
            width: dashSize ?? 12.em,
            raw: {'animation': '1.5s ease-in-out infinite alternate bounding'},
          ),
          alt: 'FlutterKaigi Dash',
          src: '/img/flutterkaigi_dash.png',
        ),
      ],
    );
  }
}
