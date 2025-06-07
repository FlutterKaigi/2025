import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class ExternalLink extends StatelessComponent {
  const ExternalLink({
    required this.content,
    required this.url,
    super.key,
    this.target = Target.blank,
    this.styles,
  });

  final Component content;
  final String url;
  final Target target;
  final Styles? styles;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    const baseStyle = Styles(
      cursor: Cursor.pointer,
      color: Color.variable('--link-color'),
      textDecoration: TextDecoration(line: TextDecorationLine.underline),
    );
    yield Link(
      to: url,
      child: content,
      target: target,
      styles: baseStyle.combine(styles ?? const Styles()),
    );
  }
}
