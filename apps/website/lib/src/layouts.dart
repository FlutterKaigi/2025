import 'package:web/web.dart';
import 'package:flutterkaigi_2025_website/config.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import './components.dart';
import './path.dart' show currentPath;

HTMLElement basicLayout(HTMLElement child) =>
    HTMLDivElement()
      ..style.display = 'flex'
      ..style.flexDirection = 'column'
      ..style.width = 'auto'
      ..style.minHeight = '100vh'
      ..append(
        HTMLElement.header()
          ..style.display = 'flex'
          ..style.justifyContent = 'end'
          ..style.gap = '0.5rem'
          ..style.padding = '1rem'
          ..append(
            user.lang == Language.ja
                ? (HTMLSpanElement()..textContent = contents.lang.ja)
                : internalLink(
                  contents.lang.ja,
                  path: currentPath.withLang(Language.ja),
                ),
          )
          ..append(
            user.lang == Language.en
                ? (HTMLSpanElement()..textContent = contents.lang.en)
                : internalLink(
                  contents.lang.en,
                  path: currentPath.withLang(Language.en),
                ),
          ),
      )
      ..append(child..style.flex = '1')
      ..append(
        HTMLElement.footer()
          ..style.display = 'flex'
          ..style.justifyContent = 'center'
          ..style.gap = '1rem'
          ..style.padding = '1rem'
          ..append(
            HTMLSpanElement()
              ..textContent = '© ${site.since} ${site.organizer}',
          )
          ..append(
            externalLink(text(contents.repository), url: site.repository.url),
          ),
      );
