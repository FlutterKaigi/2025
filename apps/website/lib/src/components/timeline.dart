import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';
import 'package:markdown/markdown.dart';

@client
class Timeline extends StatefulComponent {
  const Timeline({
    required this.title,
    required this.url,
    required this.venueName,
    required this.startHour,
    required this.startMinute,
    required this.description,
    required this.speakers,
    required this.speakerAvatarUrls,
    required this.speakerXIds,
  });
  final String title;
  final String venueName;
  final String? url;
  final String? description;

  final int startHour;
  final int startMinute;

  // NOTE: @clientにレコード型渡せなかったので，分解して渡しています
  final List<String> speakers;
  final List<String?> speakerAvatarUrls;
  final List<String?> speakerXIds;

  @override
  State<Timeline> createState() => _TimelineState();

  @css
  static final styles = [
    css('.session-info', [
      css('h1').styles(
        fontWeight: FontWeight.bold,
        fontSize: 1.5.em,
      ),
      css('h2').styles(
        fontWeight: FontWeight.bold,
        fontSize: 1.2.em,
      ),
      css('h3').styles(
        fontWeight: FontWeight.bold,
      ),
      css('p').styles(
        display: Display.block,
        whiteSpace: WhiteSpace.preWrap,
      ),
      css('strong').styles(
        fontWeight: FontWeight.bold,
      ),
      css('code').styles(
        backgroundColor: const Color('lightgray'),
        padding: Spacing.symmetric(horizontal: 0.2.em, vertical: 0.1.em),
        radius: BorderRadius.circular(0.2.em),
      ),
      css('ul').styles(
        display: Display.block,
        padding: Spacing.only(left: 1.5.em),
      ),
      css('li').styles(
        display: Display.listItem,
        raw: {
          'list-style-type': 'disc',
        },
      ),
    ]),
  ];
}

class _TimelineState extends State<Timeline> {
  bool _isOpen = false;
  final List<SpeakerEntry> _speakers = [];

  @override
  void initState() {
    super.initState();
    if (_speakers.isEmpty) {
      for (var i = 0; i < component.speakers.length; i++) {
        _speakers.add(
          (
            name: component.speakers[i],
            avatarUrl: component.speakerAvatarUrls[i],
            xId: component.speakerXIds[i],
          ),
        );
      }
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final url = component.url;
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
          padding: Spacing.all(1.5.rem),
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
          article(
            styles: Styles(
              display: Display.flex,
              width: 100.percent,
              maxWidth: 960.px,
              maxHeight: 75.vh,
              overflow: const Overflow.only(y: Overflow.auto),
              padding: Spacing.only(
                left: 1.rem,
                right: 1.rem,
                top: 0.rem,
                bottom: 2.rem,
              ),
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
              div(
                styles: Styles(
                  padding: Padding.only(top: 1.rem),
                  position: Position.sticky(top: 0.px),
                  backgroundColor: Color.inherit,
                ),
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
                  ul(
                    styles: Styles(
                      display: Display.flex,
                      gap: Gap.all(1.rem),
                      margin: Margin.only(top: 0.5.rem),
                    ),
                    [
                      li([
                        text(
                          '${component.venueName} '
                          '${component.startHour.toString().padLeft(2, '0')}:'
                          '${component.startMinute.toString().padLeft(2, '0')}',
                        ),
                      ]),
                      if (url != null)
                        li([
                          ExternalLink(
                            url: url,
                            content: 'Fortee'.toComponent,
                          ),
                        ]),
                    ],
                  ),
                  ul(
                    styles: Styles(
                      width: 100.percent,
                      display: Display.flex,
                      gap: Gap.all(0.5.rem),
                      margin: Margin.symmetric(vertical: 0.5.rem),
                    ),
                    _speakers
                        .map(
                          (speaker) => li(
                            styles: const Styles(
                              display: Display.flex,
                              alignItems: AlignItems.center,
                            ),
                            [
                              if (speaker.avatarUrl != null)
                                img(
                                  styles: Styles(
                                    width: 2.rem,
                                    height: 2.rem,
                                    radius: BorderRadius.circular(1.rem),
                                    margin: Margin.only(right: 0.5.rem),
                                    overflow: Overflow.hidden,
                                    raw: {
                                      'vertical-align': 'middle',
                                    },
                                  ),
                                  src: speaker.avatarUrl!,
                                  alt: '${speaker.name}のアバター',
                                ),
                              if (speaker.xId != null)
                                ExternalLink(
                                  url: 'https://x.com/${speaker.xId}',
                                  content: speaker.name.toComponent,
                                ),
                              if (speaker.xId == null) text(speaker.name),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              section(
                classes: 'session-info',
                styles: Styles(
                  width: 100.percent,
                  whiteSpace: WhiteSpace.preWrap,
                ),
                [raw(markdownToHtml(component.description ?? ''))],
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
