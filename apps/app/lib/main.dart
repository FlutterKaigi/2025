import 'dart:developer';

import 'package:app/core/provider/environment.dart';
import 'package:app/core/ui/app.dart';
import 'package:app/core/ui/main/widget_build_error_screen.dart';
import 'package:app/core/util/setup_web_environment.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:app/features/auth/data/provider/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ErrorWidget.builder = (details) => WidgetBuildErrorScreen(details: details);

  setupWebEnvironment();
  final container = ProviderContainer();
  final environment = container.read(environmentProvider);
  await container
      .read(authServiceProvider)
      .initialize(
        supabaseUrl: environment.supabaseUrl,
        supabaseKey: environment.supabaseKey,
        isDebug: kDebugMode,
      );
  try {
    // `authNotifierProvider` のビルド時に中断されないようにするために監視しておく
    final authSubscription = container.listen(
      authNotifierProvider,
      (_, _) {},
    );
    await container.read(authNotifierProvider.future);
    authSubscription.close();
  } on Exception catch (e) {
    log(e.toString());
  }
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}
