import 'package:app/core/provider/bff_client.dart';
import 'package:app/features/force_update/force_update_checker.dart';
import 'package:app/features/force_update/force_update_state.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'force_update_provider.g.dart';

@riverpod
ForceUpdateChecker forceUpdateChecker(Ref ref) {
  final client = ref.watch(bffClientProvider);
  return ForceUpdateChecker(client);
}

@riverpod
class ForceUpdateStateNotifier extends _$ForceUpdateStateNotifier {
  @override
  ForceUpdateState build() {
    return const ForceUpdateState();
  }

  Future<void> checkForUpdate() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();

      final checker = ref.read(forceUpdateCheckerProvider);
      final updateInfo = await checker.checkVersion();

      if (updateInfo != null) {
        final currentVersion = packageInfo.version;
        final minimumVersion = switch (defaultTargetPlatform) {
          TargetPlatform.iOS => updateInfo.minimumVersion.ios,
          TargetPlatform.android => updateInfo.minimumVersion.android,
          _ => '0.0.0',
        };
        final isRequired = checker.isUpdateRequired(
          currentVersion,
          minimumVersion,
        );

        state = state.copyWith(
          isUpdateRequired: isRequired,
          versionInfo: isRequired ? updateInfo : null,
          platform: defaultTargetPlatform,
        );
      } else {
        state = state.copyWith();
      }
    } on Exception catch (e) {
      debugPrint('Force update check failed: $e');
      state = state.copyWith();
    }
  }

  void markDialogShown() {
    state = state.copyWith(isUpdateRequired: false);
  }
}
