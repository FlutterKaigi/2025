import 'package:jaspr/jaspr.dart';

class Timeline extends StatelessComponent {
  const Timeline({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield p(
      styles: Styles(
        margin: Margin.symmetric(vertical: 1.5.rem),
        textAlign: TextAlign.center,
        fontSize: 1.5.rem,
        fontWeight: FontWeight.bold,
        lineHeight: 2.rem,
      ),
      [
        const Text('Coming Soon...'),
      ],
    );
  }
}
