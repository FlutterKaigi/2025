import 'package:flutterkaigi_2025/path.dart' show Path;
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class InternalLink extends StatelessComponent {
  const InternalLink({
    super.key,
    required this.content,
    required this.path,
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
      styles: Styles(
        textDecoration: TextDecoration(
          line: TextDecorationLine.underline,
        ),
        color: Color.variable('--link-color'),
        cursor: Cursor.pointer,
      ),
    );
  }
}
