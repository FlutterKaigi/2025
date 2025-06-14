import 'package:jaspr/jaspr.dart';

class Timeline extends StatelessComponent {
  const Timeline({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(1.rem),
      ),
      [
        p(
          styles: Styles(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 1.5.rem,
            lineHeight: 2.rem,
          ),
          [
            const Text('Coming Soon...'),
          ],
        ),
      ],
    );
  }
}
