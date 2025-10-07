import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:jaspr/jaspr.dart';

class SectionLayout extends StatelessComponent {
  const SectionLayout({
    required this.id,
    required this.title,
    required this.children,
    super.key,
  });

  final String id;
  final String title;
  final Iterable<Component> children;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: id,
      styles: Styles(
        display: Display.flex,
        width: const Unit.expression('calc(100% - 64px)'),
        maxWidth: globalMaxWidth,
        margin: Spacing.fromLTRB(32.px, 2.rem, 32.px, 0.px),
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.start,
      ),
      [
        h2(
          styles: Styles(
            margin: Margin.only(bottom: 1.5.rem),
            fontFamily: const FontFamily('Lexend'),
            fontSize: 2.rem,
            fontWeight: FontWeight.w900,
          ),
          [text(title)],
        ),
        ...children,
      ],
    );
  }
}
