import 'package:app/core/provider/bff_client.dart';
import 'package:app/features/force_update/force_update_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'force_update_provider.g.dart';

@riverpod
ForceUpdateChecker forceUpdateChecker(Ref ref) {
  final client = ref.watch(bffClientProvider);
  return ForceUpdateChecker(client);
}