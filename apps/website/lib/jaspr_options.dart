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
import 'package:flutterkaigi_2025_website/src/components/timeline.dart'
    as prefix3;

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

    prefix3.Timeline: ClientTarget<prefix3.Timeline>(
      'src/components/timeline',
      params: _prefix3Timeline,
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
  'type': c.type,
  'snsX': c.snsX,
};
Map<String, dynamic> _prefix3Timeline(prefix3.Timeline c) => {
  'title': c.title,
  'url': c.url,
  'description': c.description,
};
