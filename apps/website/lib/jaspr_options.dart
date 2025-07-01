// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:flutterkaigi_2025_website/src/components/countdown_view.dart'
    as prefix0;
import 'package:flutterkaigi_2025_website/src/components/sponsor.dart'
    as prefix1;
import 'package:flutterkaigi_2025_website/src/components/tagline.dart'
    as prefix2;

/// Default [JasprOptions] for use with your jaspr project.
///
/// Use this to initialize jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'jaspr_options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultJasprOptions,
///   );
///
///   runApp(...);
/// }
/// ```
JasprOptions get defaultJasprOptions => JasprOptions(
  clients: {
    prefix0.CountdownView: ClientTarget<prefix0.CountdownView>(
      'src/components/countdown_view',
    ),

    prefix1.Sponsor: ClientTarget<prefix1.Sponsor>(
      'src/components/sponsor',
      params: _prefix1Sponsor,
    ),
  },
  styles: () => [...prefix2.Tagline.styles],
);

Map<String, dynamic> _prefix1Sponsor(prefix1.Sponsor c) => {
  'name': c.name,
  'logo': c.logo,
  'width': c.width,
  'pr': c.pr,
  'url': c.url,
  'snsX': c.snsX,
};
