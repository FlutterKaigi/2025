import 'package:flutterkaigi_2025/components/footer.dart';
import 'package:flutterkaigi_2025/config.dart' show makeTitle, user;
import 'package:flutterkaigi_2025/pages/404.dart';
import 'package:flutterkaigi_2025/pages/dashsay.dart';
import 'package:flutterkaigi_2025/text.dart' show Language;
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'components/header.dart';
import 'pages/home.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        minHeight: 100.vh,
        width: Unit.auto,
      ),
      [
        Router(
          routes: [
            ..._createLanguageRoutes(
              path: '/',
              title: 'Home',
              builder: (context, state) => const Home(),
            ),
            ..._createLanguageRoutes(
              path: '/dashsay',
              title: makeTitle('Dash say'),
              builder: (context, state) => Dashsay(
                message: state.queryParams['m'] ?? '',
              ),
            )
          ],
          errorBuilder: (context, state) => _BasicLayout(
            child: const NotFound(),
          ),
        ),
      ],
    );
  }
}

class _BasicLayout extends StatelessComponent {
  _BasicLayout({required this.child});
  final Component child;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Header(
      styles: Styles(
        position: Position.sticky(top: 0.px),
        border: Border.only(
          bottom: BorderSide.solid(
            color: Color.variable('--border-color'),
            width: 1.px,
          ),
        ),
      ),
    );
    yield child;
    yield Footer();
  }
}

List<Route> _createLanguageRoutes({
  required String path,
  required String title,
  required Component Function(BuildContext, RouteState) builder,
}) {
  return [
    Route(
      path: path,
      title: title,
      builder: (context, state) => _BasicLayout(child: builder(context, state)),
    ),
    // Japanese route
    Route(
      path: '/ja${path == '/' ? '' : path}',
      title: title,
      builder: (context, state) {
        // Set language to Japanese
        user.lang = Language.ja;
        return _BasicLayout(child: builder(context, state));
      },
    ),
    // English route
    Route(
      path: '/en${path == '/' ? '' : path}',
      title: title,
      builder: (context, state) {
        // Set language to English
        user.lang = Language.en;
        return _BasicLayout(child: builder(context, state));
      },
    ),
  ];
}
