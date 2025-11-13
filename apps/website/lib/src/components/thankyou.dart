import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:jaspr/jaspr.dart';

class Thankyou extends StatelessComponent {
  @override
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'bubble',
      styles: Styles(
        margin: Spacing.only(top: 4.rem),
        fontFamily: lexendFontFamily,
        color: const Color.variable('--secondary-color'),
        fontSize: 2.rem,
      ),
      [text('Thank you!')],
    );
    yield img(
      src: '/img/flutterkaigi_dash.png',
      alt: 'FlutterKaigi Dash',
      styles: Styles(
        height: 6.rem,
      ),
    );
  }
}
