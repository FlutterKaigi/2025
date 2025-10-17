import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upsert_device.freezed.dart';
part 'upsert_device.g.dart';

@freezed
abstract class UpsertDevice with _$UpsertDevice {
  const factory UpsertDevice({
    required String id,
    required String userId,
    required DeviceType type,
    required String name,
  }) = _UpsertDevice;

  factory UpsertDevice.fromJson(Map<String, dynamic> json) =>
    _$UpsertDeviceFromJson(json);
}
