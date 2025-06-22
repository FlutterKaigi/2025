import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:jaspr/jaspr.dart';

class TopEventInfo extends StatelessComponent {
  const TopEventInfo({
    required this.iconPath,
    required this.contents,
    super.key,
  });

  final String iconPath;
  final Component contents;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      styles: Styles(
        display: Display.flex,
        padding: Padding.symmetric(vertical: 4.px),
        alignItems: AlignItems.center,
        gap: Gap.all(12.px),
      ),
      [
        img(
          src: iconPath,
          styles: Styles(width: 1.5.rem, height: 1.5.rem),
        ),
        p(
          styles: Styles(
            color: Colors.white,
            fontFamily: lexendFontFamily,
            fontSize: 1.rem,
          ),
          [contents],
        ),
      ],
    );
  }
}
