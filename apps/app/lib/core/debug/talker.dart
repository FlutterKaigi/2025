import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

final talker = TalkerFlutter.init(
  settings: kDebugMode
      ? null
      : TalkerSettings(
          enabled: false,
        ),
);
