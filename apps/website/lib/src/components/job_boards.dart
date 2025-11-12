import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:jaspr/jaspr.dart';

class JobBoards extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ul(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        padding: Padding.all(1.rem),
        gap: Gap.all(1.rem),
      ),
      event.jobBoards
          .map(
            (jobBoard) => li(
              styles: Styles(
                backgroundColor: Colors.white,
                radius: BorderRadius.circular(1.rem),
                overflow: Overflow.hidden,
                maxWidth: 760.px,
              ),
              [
                ExternalLink(
                  content: img(
                    src: jobBoard.imageUrl,
                    alt: jobBoard.altText,
                    styles: Styles(
                      maxWidth: 100.percent,
                      cursor: Cursor.pointer,
                    ),
                  ),
                  url: jobBoard.url,
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
