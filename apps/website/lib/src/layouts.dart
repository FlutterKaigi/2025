import 'package:flutterkaigi_2025_website/config.dart';
import 'package:flutterkaigi_2025_website/src/components.dart';
import 'package:flutterkaigi_2025_website/src/path.dart' show Path, currentPath;
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:web/web.dart';

HTMLElement basicLayout(HTMLElement child) =>
    HTMLDivElement()
      ..style.display = 'flex'
      ..style.flexDirection = 'column'
      ..style.width = 'auto'
      ..style.minHeight = '100vh'
      ..appendAll([
        _header
          ..style.position = 'sticky'
          ..style.top = '0'
          ..style.borderBottom = '1px solid var(--border-color)',
        child
          ..style.padding = '0'
          ..style.flex = '1'
          ..style.overflow = 'hidden',
        _footer..style.borderTop = '1px solid var(--border-color)',
      ]);

HTMLElement sectionLayout(String title, HTMLElement child) =>
    HTMLElement.section()
      ..style.display = 'flex'
      ..style.flexDirection = 'column'
      ..style.justifyContent = 'start'
      ..style.gap = '2rem'
      ..style.minWidth = 'min(600px, calc(100vw - 64px))'
      ..style.margin = '0 32px'
      ..appendAll([
        HTMLHeadingElement.h2()
          ..textContent = title
          ..style.fontSize = '1.5rem'
          ..style.fontWeight = 'bold'
          ..style.fontFamily = 'Lexend',
        child
          ..style.padding = '0'
          ..style.flex = '1',
      ]);

HTMLElement get _header =>
    HTMLElement.header()
      ..style.zIndex = '10'
      ..style.display = 'grid'
      ..style.gridTemplateColumns = '1fr 0fr'
      ..style.padding = '1rem'
      ..style.backdropFilter = 'blur(10px)'
      ..appendAll([
        HTMLUListElement()..appendAll([
          HTMLLIElement()..append(
            internalLink(
              HTMLImageElement()
                ..style.height = '2em'
                ..style.verticalAlign = 'middle'
                ..style.cursor = 'pointer'
                ..alt = '${site.title} logo'
                ..src = '/img/icon_flutterkaigi_full_light.svg',
              path: Path.go(),
            ),
          ),
        ]),
        HTMLUListElement()
          ..style.display = 'flex'
          ..style.flexDirection = 'row'
          ..style.alignItems = 'center'
          ..style.gap = '0.5em'
          ..style.fontSize = 'inherit'
          ..appendAll([
            _languageLink(Language.ja, contents.lang.ja),
            _languageLink(Language.en, contents.lang.en),
          ]),
      ]);

HTMLElement _languageLink(Language lang, String title) =>
    user.lang == lang
        ? (HTMLLIElement()..textContent = title)
        : (HTMLLIElement()..append(
          internalLink(Text(title), path: currentPath.withLang(lang)),
        ));

HTMLElement get _footer =>
    HTMLElement.footer()
      ..style.display = 'flex'
      ..style.flexDirection = 'column'
      ..style.justifyContent = 'center'
      ..style.alignItems = 'center'
      ..style.gap = '1rem'
      ..style.padding = '1rem'
      ..append(_pastEvents)
      ..append(_snsLinks)
      ..append(_externalLinks)
      ..append(_copyright);

HTMLElement get _pastEvents =>
    HTMLUListElement()
      ..style.display = 'flex'
      ..style.flexDirection = 'row'
      ..style.flexWrap = 'wrap'
      ..style.justifyContent = 'center'
      ..style.gap = '1em'
      ..appendAll(
        event.pastEvents.map(
          (event) =>
              HTMLLIElement()
                ..append(externalLink(event.title, url: event.url)),
        ),
      );

HTMLElement get _snsLinks =>
    HTMLUListElement()
      ..style.display = 'flex'
      ..style.flexDirection = 'row'
      ..style.flexWrap = 'wrap'
      ..style.justifyContent = 'center'
      ..style.gap = '1em'
      ..style.fontSize = 'inherit'
      ..appendAll(
        site.snsLinks.map(
          (link) =>
              HTMLLIElement()
                ..style.display = 'flex'
                ..style.flexDirection = 'row'
                ..style.justifyContent = 'center'
                ..style.alignItems = 'center'
                ..style.gap = '0.1em'
                ..style.fontSize = 'inherit'
                ..appendAll([
                  HTMLImageElement()
                    ..style.height = '1.5em'
                    ..style.verticalAlign = 'middle'
                    ..alt = '${link.title} logo'
                    ..src = link.icon,
                  externalLink(link.title, url: link.url),
                ]),
        ),
      );

HTMLElement get _externalLinks =>
    HTMLUListElement()
      ..style.display = 'flex'
      ..style.flexDirection = 'row'
      ..style.flexWrap = 'wrap'
      ..style.justifyContent = 'center'
      ..style.gap = '1em'
      ..style.fontSize = 'inherit'
      ..appendAll(
        site.externalLinks.map(
          (link) =>
              HTMLLIElement()
                ..style.display = 'flex'
                ..style.flexDirection = 'row'
                ..style.justifyContent = 'center'
                ..style.alignItems = 'center'
                ..style.gap = '0.1em'
                ..style.fontSize = 'inherit'
                ..append(externalLink(text(link.title), url: text(link.url))),
        ),
      );

HTMLElement get _copyright =>
    HTMLUListElement()
      ..style.display = 'flex'
      ..style.flexDirection = 'column'
      ..style.justifyContent = 'center'
      ..style.alignItems = 'center'
      ..style.gap = '0.5em'
      ..style.fontSize = 'inherit'
      ..appendAll([
        HTMLLIElement()
          ..style.fontSize = 'inherit'
          ..textContent = '© ${site.since} - ${site.until} ${site.organizer}',
        HTMLLIElement()
          ..style.fontSize = '0.8em'
          ..textContent =
              'Flutter and the related logo are trademarks of Google LLC.'
              ' FlutterKaigi is not affiliated with or otherwise sponsored'
              ' by Google LLC.',
        HTMLLIElement()
          ..style.fontSize = '0.8em'
          ..appendAll([
            Text('The Flutter name and the Flutter logo '),
            HTMLImageElement()
              ..style.height = '0.8em'
              ..style.verticalAlign = 'middle'
              ..alt = 'Flutter logo'
              ..src = '/img/icon_flutter.svg',
            Text(' are trademarks of Google LLC.'),
          ]),
      ]);
