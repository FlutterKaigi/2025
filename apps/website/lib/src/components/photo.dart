import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';

class Photos extends StatelessComponent {
  const Photos({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ul(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(0.5.rem),
      ),
      site.albumLinks
          .map(
            (album) => li(
              styles: Styles(
                width: 100.percent,
                maxWidth: 36.em,
              ),
              [
                ExternalLink(
                  content: album.title.text(context).toComponent,
                  url: album.url.text(context),
                  styles: const Styles(
                    color: Color.variable('--text-color'),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
