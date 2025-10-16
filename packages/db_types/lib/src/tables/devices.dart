import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'devices.freezed.dart';
part 'devices.g.dart';

enum DeviceType {
  ios,
  android,
  web,
}

@freezed
abstract class Devices with _$Devices {
  const factory Devices({
    required String id,
    required String userId,
    required DeviceType type,
    required String name,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _Devices;

  factory Devices.fromJson(Map<String, dynamic> json) =>
      _$DevicesFromJson(json);
}
