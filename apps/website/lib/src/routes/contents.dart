import 'package:web/web.dart';
import '../layouts.dart';
import 'package:flutterkaigi_2025_website/text.dart';

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
