import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/components/open_in_new.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class News extends StatelessComponent {
  const News({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      styles: Styles(
        display: Display.flex,
        padding: Padding.symmetric(vertical: 1.rem),
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        justifyContent: JustifyContent.spaceAround,
        gap: Gap.all(1.rem),
      ),
      [
        ul(
          styles: Styles(
            display: Display.flex,
            flexDirection: FlexDirection.column,
            gap: Gap.all(0.5.rem),
          ),
          event.news
              .take(5)
              .map(
                (news) => li([
                  ExternalLink(
                    content: text(news.title),
                    url: news.url,
                    styles: const Styles(
                      color: Color.variable('--text-color'),
                    ),
                  ),
                ]),
              )
              .toList(),
        ),
        Link(
          to: event.blog.topUrl,
          child: button(
            classes: 'primary-button',
            styles: Styles(
              display: Display.flex,
              position: const Position.relative(),
              cursor: Cursor.pointer,
              justifyContent: JustifyContent.center,
              gap: Gap.all(1.rem),
            ),
            [
              span(
                styles: Styles(
                  color: Colors.white,
                  fontSize: 1.rem,
                ),
                [text(contents.checkNews.text(context))],
              ),
              const OpenInNew(),
            ],
          ),
        ),
      ],
    );
  }
}
