import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class ExternalLink extends StatelessComponent {
  const ExternalLink({
    super.key,
    required this.content,
    required this.url,
    this.target = Target.blank,
    this.styles,
  });

  final Component content;
  final String url;
  final Target target;
  final Styles? styles;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final baseStyle = Styles(
      textDecoration: TextDecoration(
        line: TextDecorationLine.underline,
      ),
      color: Color.variable('--link-color'),
      cursor: Cursor.pointer,
    );
    yield Link(
      to: url,
      child: content,
      target: target,
      styles: baseStyle.combine(styles ?? Styles()),
    );
  }
}
