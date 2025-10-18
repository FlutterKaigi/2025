import 'dart:io';

import 'package:app/core/provider/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:opentelemetry/api.dart' as sdk;
import 'package:opentelemetry/api.dart';
import 'package:opentelemetry/sdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tracer_provider.g.dart';

@Riverpod(keepAlive: true)
sdk.TracerProvider tracer(Ref ref) {
  final environments = ref.watch(environmentProvider);

  return TracerProviderBase(
    processors: [
      BatchSpanProcessor(
        CollectorExporter(
          Uri.parse('https://otlp.flutterkaigi.jp/v1/traces'),
        ),
      ),
      SimpleSpanProcessor(
        ConsoleExporter(),
      ),
    ],
    resource: Resource([
      Attribute.fromString('service.name', 'app'),
      Attribute.fromString(
        'service.namespace',
        'flutterkaigi-2025-${environments.flavor.name}',
      ),
      Attribute.fromString('service.version', '1.0.0'),
      Attribute.fromString('telemetry.sdk.language', 'dart'),
      // commit information
      Attribute.fromString('commit.sha', environments.commitInformation ?? ''),
      Attribute.fromString(
        'os.type',
        kIsWeb ? 'web' : defaultTargetPlatform.name,
      ),
      Attribute.fromString('flutter.version', FlutterVersion.version ?? ''),
      Attribute.fromString('dart.version', FlutterVersion.dartVersion ?? ''),
      if (!kIsWeb) ...[
        Attribute.fromString('os.description', Platform.operatingSystem),
        Attribute.fromString('os.version', Platform.operatingSystemVersion),
        Attribute.fromString('os.platform', Platform.operatingSystem),
      ],
    ]),
  );
}
