import 'package:bff_client/bff_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'force_update_state.freezed.dart';

@freezed
abstract class ForceUpdateState with _$ForceUpdateState {
  const factory ForceUpdateState({
    @Default(false) bool isUpdateRequired,
    @Default(false) bool hasChecked,
    AppVersionResponse? versionInfo,
    String? platform,
  }) = _ForceUpdateState;
}
