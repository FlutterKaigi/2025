import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:app/core/firebase/production.dart' as firebase_production;
import 'package:app/core/firebase/staging.dart' as firebase_staging;
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/provider/environment.dart';
import 'package:app/core/ui/app.dart';
import 'package:app/core/ui/main/widget_build_error_screen.dart';
import 'package:app/core/util/setup_web_environment.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:app/features/auth/data/provider/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterrific_opentelemetry/flutterrific_opentelemetry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    FlutterOTel.reportError(
      'FlutterError.onError',
      details.exception,
      details.stack,
    );
  };

  await runZonedGuarded(
    () async {
      await FlutterOTel.initialize(
        appName: 'app',
        tracerName: 'main',
        resourceAttributes: Attributes.of({
          'deployment.environment': 'production',
          'service.namespace': 'flutterkaigi-2025-production',
          'flutter.version': FlutterVersion.version ?? '',
          'dart.version': FlutterVersion.dartVersion ?? '',
          'os.type': defaultTargetPlatform.name,
          if (!kIsWeb) ...{
            'os.version': Platform.operatingSystemVersion,
            'os.platform': Platform.operatingSystem,
          },
        }),
      );
      await _run();
    },
    (error, stack) => FlutterOTel.reportError('runZoneGuarded', error, stack),
  );
}

Future<void> _run() async {
  await LocaleSettings.useDeviceLocale();

  ErrorWidget.builder = (details) => WidgetBuildErrorScreen(details: details);

  setupWebEnvironment();
  final container = ProviderContainer();
  final environment = container.read(environmentProvider);
  await Firebase.initializeApp(
    options: switch (environment.flavor) {
      Flavor.production =>
        firebase_production.DefaultFirebaseOptions.currentPlatform,
      _ => firebase_staging.DefaultFirebaseOptions.currentPlatform,
    },
  );
  await container
      .read(authServiceProvider)
      .initialize(
        supabaseUrl: environment.supabaseUrl,
        supabaseKey: environment.supabaseKey,
        isDebug: kDebugMode,
      );
  try {
    // `authProvider` のビルド時に中断されないようにするために監視しておく
    final authSubscription = container.listen(
      authProvider,
      (_, _) {},
    );
    await container.read(authProvider.future);
    authSubscription.close();
  } on Exception catch (e) {
    log(e.toString());
  }
  runApp(
    TranslationProvider(
      child: UncontrolledProviderScope(
        container: container,
        child: const App(),
      ),
    ),
  );
}
