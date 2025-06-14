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
        padding: Padding.all(1.rem),
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
        flex: const Flex(grow: 1),
        fontSize: 2.rem,
      ),
      [
        text('404 Not Found'),
        InternalLink(
          path: Path.fromPathname(context.url).go(),
          content: contents.moveToTop.text(context).toComponent,
        ),
      ],
    );
  }
}
