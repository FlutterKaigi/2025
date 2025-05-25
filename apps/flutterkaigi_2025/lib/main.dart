import 'package:jaspr/server.dart';
import 'app.dart';
import 'jaspr_options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultJasprOptions,
  );

  runApp(Document(
    title: 'flutterkaigi_2025',
    head: [
      meta(httpEquiv: "X-UA-Compatible", content: "IE=edge"),
      // OGP
      DomComponent(tag: 'meta', attributes: {
        'property': 'og:title',
        'content': 'FlutterKaigi 2025',
      }),
      DomComponent(tag: 'meta', attributes: {
        'property': 'og:description',
        'content':
            '2025年、日本国内でFlutterをメインに扱う技術カンファレンス。FlutterやDartの深い知見を持つ開発者によるセッションを多数企画します。',
      }),
      DomComponent(tag: 'meta', attributes: {
        'property': 'og:image',
        'content': 'https://2025.flutterkaigi.jp/img/ogp.png',
      }),
      DomComponent(tag: 'meta', attributes: {
        'property': 'og:type',
        'content': 'website',
      }),
      DomComponent(tag: 'meta', attributes: {
        'property': 'og:url',
        'content': 'https://2025.flutterkaigi.jp',
      }),
      meta(name: 'twitter:card', content: 'summary_large_image'),
      meta(name: 'twitter:site', content: '@FlutterKaigi'),
      link(rel: 'icon', href: '/img/favicon.ico', type: 'image/png'),
      link(rel: 'apple-touch-icon', href: '/img/favicon.png'),
      link(rel: 'stylesheet', href: 'styles.css', type: 'text/css'),
      script(
        [],
        src: 'https://www.googletagmanager.com/gtag/js?id=G-L9WHLCCTGM',
        async: true,
      ),
      DomComponent(
        tag: 'script',
        children: [
          RawText('''
      window.dataLayer = window.dataLayer || [];
      function gtag() {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'G-L9WHLCCTGM');
''')
        ],
      ),
    ],
    body: App(),
  ));
}
