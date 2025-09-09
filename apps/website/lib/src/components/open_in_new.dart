import 'package:jaspr/jaspr.dart';

class OpenInNew extends StatelessComponent {
  const OpenInNew({super.key, this.color});

  final Color? color;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final colorCode = color ?? const Color.value(0xe3e3e3);
    yield div(
      styles: Styles(
        width: 1.5.em,
        height: 1.5.em,
        backgroundColor: colorCode,
        raw: {
          'mask': 'url(/img/icon/open-in-new.svg) no-repeat center',
          '-webkit-mask': 'url(/img/icon/open-in-new.svg) no-repeat center',
        },
      ),
      [],
    );
  }
}
