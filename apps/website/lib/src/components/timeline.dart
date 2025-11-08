import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:jaspr/jaspr.dart';

@client
class Timeline extends StatefulComponent {
  const Timeline({
    required this.title,
    required this.url,
    required this.description,
  });
  final String title;
  final String? url;
  final String? description;

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  bool _isOpen = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      button(
        styles: Styles(
          position: const Position.relative(),
          cursor: component.description != null ? Cursor.pointer : null,
          textDecoration: component.description != null
              ? const TextDecoration(line: TextDecorationLine.underline)
              : null,
        ),
        onClick: component.description != null
            ? () {
                setState(() {
                  _isOpen = !_isOpen;
                });
              }
            : null,
        [
          text(component.title),
        ],
      ),
      dialog(
        open: _isOpen,
        styles: Styles(
          display: _isOpen ? Display.flex : Display.none,
          position: Position.fixed(top: 0.px, left: 0.px),
          zIndex: const ZIndex(10),
          width: 100.vw,
          height: 100.vh,
          padding: Spacing.all(1.rem),
          boxSizing: BoxSizing.borderBox,
          cursor: Cursor.pointer,
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
          backgroundColor: const Color.rgba(0, 0, 0, 0.5),
        ),
        events: {
          'click': (event) {
            setState(() {
              _isOpen = false;
            });
          },
        },
        [
          section(
            styles: Styles(
              display: Display.flex,
              width: 100.percent,
              maxWidth: 960.px,
              padding: Spacing.all(1.rem),
              radius: BorderRadius.circular(1.rem),
              flexDirection: FlexDirection.column,
              alignItems: AlignItems.center,
              gap: Gap.all(1.rem),
              backgroundColor: Colors.white,
            ),
            events: {
              'click': (event) {
                event.stopPropagation();
              },
            },
            [
              h3(
                styles: Styles(
                  width: 100.percent,
                  fontFamily: lexendFontFamily,
                  fontSize: 1.5.rem,
                  fontWeight: FontWeight.bold,
                ),
                [text(component.title)],
              ),
              p(
                styles: Styles(
                  width: 100.percent,
                  whiteSpace: WhiteSpace.preWrap,
                ),
                [text(component.description ?? '')],
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
