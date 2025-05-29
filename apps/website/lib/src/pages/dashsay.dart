import 'package:jaspr/jaspr.dart';

class Dashsay extends StatelessComponent {
  const Dashsay({required this.message, super.key});

  final String message;

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
            padding: Padding.all(1.rem),
            border: const Border(color: Color.variable('--border-color')),
            radius: BorderRadius.only(
              topLeft: Radius.circular(1.rem),
              topRight: Radius.circular(1.rem),
              bottomRight: Radius.circular(0.rem),
              bottomLeft: Radius.circular(1.rem),
            ),
            fontSize: 1.5.em,
          ),
          [text(Uri.decodeFull(message))],
        ),
        img(
          styles: Styles(
            width: 12.em,
            raw: {'animation': '1.5s ease-in-out infinite alternate bounding'},
          ),
          alt: 'FlutterKaigi Dash',
          src: '/img/flutterkaigi_dash.png',
        ),
      ],
    );
  }
}
