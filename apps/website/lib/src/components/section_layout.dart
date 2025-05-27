import 'package:jaspr/jaspr.dart';

class SectionLayout extends StatelessComponent {
  const SectionLayout({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final Iterable<Component> children;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.start,
        gap: Gap.all(2.rem),
        margin: Spacing.fromLTRB(32.px, 2.rem, 32.px, 0.px),
        raw: {
          'min-width': 'min(600px, calc(100vw - 64px))',
        },
      ),
      [
        h2(
          styles: Styles(
            fontFamily: FontFamily('Lexend'),
            fontWeight: FontWeight.bold,
            fontSize: 1.5.rem,
          ),
          [text(title)],
        ),
        ...children,
      ],
    );
  }
}
