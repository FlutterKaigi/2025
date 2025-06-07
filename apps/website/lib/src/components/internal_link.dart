import 'package:flutterkaigi_2025_website/src/path.dart' show Path;
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class InternalLink extends StatelessComponent {
  const InternalLink({
    required this.content,
    required this.path,
    super.key,
    this.target = Target.top,
  });

  final Component content;
  final Path path;
  final Target target;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Link(
      to: path.toString(),
      child: content,
      target: target,
      styles: const Styles(
        cursor: Cursor.pointer,
        color: Color.variable('--link-color'),
        textDecoration: TextDecoration(line: TextDecorationLine.underline),
      ),
    );
  }
}
