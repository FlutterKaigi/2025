// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:flutterkaigi_2025_website/src/components/sponsor.dart'
    as prefix0;
import 'package:flutterkaigi_2025_website/src/components/tagline.dart'
    as prefix1;
import 'package:flutterkaigi_2025_website/src/components/timeline.dart'
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
    prefix0.Sponsor: ClientTarget<prefix0.Sponsor>(
      'src/components/sponsor',
      params: _prefix0Sponsor,
    ),

    prefix2.Timeline: ClientTarget<prefix2.Timeline>(
      'src/components/timeline',
      params: _prefix2Timeline,
    ),
  },
  styles: () => [...prefix1.Tagline.styles, ...prefix2.Timeline.styles],
);

Map<String, dynamic> _prefix0Sponsor(prefix0.Sponsor c) => {
  'name': c.name,
  'logo': c.logo,
  'width': c.width,
  'pr': c.pr,
  'url': c.url,
  'type': c.type,
  'snsX': c.snsX,
};
Map<String, dynamic> _prefix2Timeline(prefix2.Timeline c) => {
  'title': c.title,
  'url': c.url,
  'venueName': c.venueName,
  'startHour': c.startHour,
  'startMinute': c.startMinute,
  'description': c.description,
  'speakers': c.speakers,
  'speakerAvatarUrls': c.speakerAvatarUrls,
  'speakerXIds': c.speakerXIds,
};
