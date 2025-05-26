import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class ExternalLink extends StatelessComponent {
  const ExternalLink({
    super.key,
    required this.content,
    required this.url,
    this.target = Target.blank,
  });

  final Component content;
  final String url;
  final Target target;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Link(
      to: url,
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
