import 'package:jaspr/jaspr.dart';

class SectionLayout extends StatelessComponent {
  const SectionLayout({required this.title, required this.children, super.key});

  final String title;
  final Iterable<Component> children;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      styles: Styles(
        display: Display.flex,
        margin: Spacing.fromLTRB(32.px, 2.rem, 32.px, 0.px),
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.start,
        gap: Gap.all(2.rem),
        raw: {'min-width': 'min(600px, calc(100vw - 64px))'},
      ),
      [
        h2(
          styles: Styles(
            fontFamily: const FontFamily('Lexend'),
            fontSize: 1.5.rem,
            fontWeight: FontWeight.bold,
          ),
          [text(title)],
        ),
        ...children,
      ],
    );
  }
}
