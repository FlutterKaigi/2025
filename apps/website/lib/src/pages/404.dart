import 'package:flutterkaigi_2025_website/src/components/internal_link.dart';
import 'package:flutterkaigi_2025_website/src/path.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';

class NotFound extends StatelessComponent {
  const NotFound({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield main_(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
        fontSize: 2.rem,
        padding: Padding.all(1.rem),
        flex: Flex(grow: 1),
      ),
      [
        text('404 Not Found'),
        InternalLink(
          path: Path.go(),
          content: text(contents.moveToTop.text),
        ),
      ],
    );
  }
}
