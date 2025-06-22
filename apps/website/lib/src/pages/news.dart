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
        justifyContent: JustifyContent.spaceAround,
        gap: Gap.all(1.rem),
      ),
      [
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
              img(src: '/img/icon/open-in-new.svg'),
            ],
          ),
        ),
      ],
    );
  }
}
