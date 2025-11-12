import 'package:flutterkaigi_2025_website/src/components/footer.dart';
import 'package:flutterkaigi_2025_website/src/components/header.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/pages/_404.dart';
import 'package:flutterkaigi_2025_website/src/pages/call_for_proposal.dart';
import 'package:flutterkaigi_2025_website/src/pages/dashsay.dart';
import 'package:flutterkaigi_2025_website/src/pages/home.dart';
import 'package:flutterkaigi_2025_website/src/pages/job-boards.dart';
import 'package:flutterkaigi_2025_website/src/pages/sponsor.dart';
import 'package:flutterkaigi_2025_website/src/pages/timeline.dart';
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
            ..._createLanguageRoutes(
              path: '/',
              title: 'FlutterKaigi 2025',
              builder: (context, state) => const Home(),
            ),
            ..._createLanguageRoutes(
              path: '/call-for-proposal',
              title: 'Call for Proposal',
              builder: (context, state) => const CallForProposal(),
            ),
            ..._createLanguageRoutes(
              path: '/timeline',
              title: 'Timeline',
              builder: (context, state) => const Timeline(),
            ),
            ..._createLanguageRoutes(
              path: '/job-boards',
              title: 'Job Boards',
              builder: (context, state) => const JobBoards(),
            ),
            ...event.sponsors
                .where((sponsor) => !sponsor.disable)
                .map(
                  (sponsor) => _createLanguageRoutes(
                    path: '/sponsor/${sponsor.slug}',
                    title: '${sponsor.name} | FlutterKaigi 2025',
                    builder: (context, state) => Sponsor(sponsor),
                  ),
                )
                .expand((routes) => routes),
            ..._createLanguageRoutes(
              path: '/dashsay',
              title: makeTitle('Dash say'),
              builder: (context, state) => Dashsay(
                // TODO static buildだとqueryParamが無効になる
                message: state.queryParams['m'] ?? 'FlutterKaigi 2025!',
              ),
            ),
            Route(
              path: '/en/404',
              title: 'Not Found',
              builder: (context, state) => const _BasicLayout(
                child: NotFound(),
              ),
            ),
            Route(
              path: '/ja/404',
              title: 'Not Found',
              builder: (context, state) => const _BasicLayout(
                child: NotFound(),
              ),
            ),
          ],
          errorBuilder: (context, state) => const _BasicLayout(
            child: NotFound(),
          ),
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
            color: const Color.rgba(255, 255, 255, 0.4),
            width: 1.px,
          ),
        ),
        shadow: BoxShadow.combine([
          BoxShadow(
            offsetX: 0.px,
            offsetY: (-8).px,
            blur: 12.px,
            color: const Color.rgba(0, 0, 0, 0.25),
          ),
        ]),
        backgroundColor: const Color.rgba(255, 255, 255, 0.4),
        raw: {
          'box-shadow':
              '0px -8px 12px rgba(0, 0, 0, 0.25), '
              'inset 0px -8px 16px 0px rgba(0, 0, 0, 0.06)',
        },
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
      builder: (context, state) => _BasicLayout(
        child: builder(context, state),
      ),
    ),
    // Japanese route
    Route(
      path: '/ja${path == '/' ? '' : path}',
      title: title,
      builder: (context, state) => _BasicLayout(
        child: builder(context, state),
      ),
    ),
    // English route
    Route(
      path: '/en${path == '/' ? '' : path}',
      title: title,
      builder: (context, state) => _BasicLayout(
        child: builder(context, state),
      ),
    ),
  ];
}
