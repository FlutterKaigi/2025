import 'package:flutterkaigi_2025_website/config.dart';
import 'package:flutterkaigi_2025_website/src/layouts.dart';
import 'package:flutterkaigi_2025_website/src/routes.dart' show Handler;
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:web/web.dart';

Handler handler(String id) => (
  title: makeTitle('Contents'),
  handle: () => contents(id),
);

HTMLElement contents(String id) => basicLayout(
  HTMLElement.main()
    ..append(
      HTMLHeadingElement.h1()
        ..textContent = text((ja: 'コンテンツ', en: 'Contents')),
    )
    ..append(
      HTMLDivElement()
        ..id = id
        ..append(
          HTMLParagraphElement()
            ..textContent = '${text((ja: '識別子', en: 'ID'))}: $id',
        ),
    ),
);
