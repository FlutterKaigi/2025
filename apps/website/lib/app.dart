import 'package:flutterkaigi_2025_website/src/components/footer.dart';
import 'package:flutterkaigi_2025_website/src/components/header.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart'
    show makeTitle, user;
import 'package:flutterkaigi_2025_website/src/pages/_404.dart';
import 'package:flutterkaigi_2025_website/src/pages/dashsay.dart';
import 'package:flutterkaigi_2025_website/src/pages/home.dart';
import 'package:flutterkaigi_2025_website/text.dart' show Language;
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      styles: Styles(
        display: Display.flex,
        width: Unit.auto,
        minHeight: 100.vh,
        flexDirection: FlexDirection.column,
      ),
      [
        Router(
          routes: [
            Route(
              path: '/404',
              title: 'Not Found',
              builder: (context, state) =>
                  const _BasicLayout(child: NotFound()),
            ),
            ..._createLanguageRoutes(
              path: '/',
              title: 'FlutterKaigi 2025',
              builder: (context, state) => const Home(),
            ),
            ..._createLanguageRoutes(
              path: '/dashsay',
              title: makeTitle('Dash say'),
              builder: (context, state) =>
                  Dashsay(message: state.queryParams['m'] ?? ''),
            ),
          ],
          errorBuilder: (context, state) =>
              const _BasicLayout(child: NotFound()),
        ),
      ],
    );
  }
}

class _BasicLayout extends StatelessComponent {
  const _BasicLayout({required this.child});
  final Component child;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Header(
      styles: Styles(
        position: Position.sticky(top: 0.px),
        border: Border.only(
          bottom: BorderSide.solid(
            color: const Color.variable('--border-color'),
            width: 1.px,
          ),
        ),
      ),
    );
    yield child;
    yield const Footer();
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
