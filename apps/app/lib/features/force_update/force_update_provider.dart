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

  Future<void> checkForUpdate({bool force = false}) async {
    if (!force && state.hasChecked) {
      return;
    }

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final platform = defaultTargetPlatform == TargetPlatform.iOS
          ? 'ios'
          : 'android';

      final checker = ref.read(forceUpdateCheckerProvider);
      final updateInfo = await checker.checkVersion();

      if (updateInfo != null) {
        final currentVersion = packageInfo.version;
        final minimumVersion = updateInfo.minimumVersion;
        final isRequired = checker.isUpdateRequired(
          currentVersion,
          minimumVersion,
        );

        state = state.copyWith(
          isUpdateRequired: isRequired,
          hasChecked: true,
          versionInfo: isRequired ? updateInfo : null,
          platform: platform,
        );
      } else {
        state = state.copyWith(hasChecked: true);
      }
    } on Exception catch (e) {
      debugPrint('Force update check failed: $e');
      state = state.copyWith(hasChecked: true);
    }
  }

  void markDialogShown() {
    state = state.copyWith(isUpdateRequired: false);
  }
}
