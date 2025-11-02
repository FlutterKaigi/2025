import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sessions.freezed.dart';
part 'sessions.g.dart';

@freezed
abstract class Sessions with _$Sessions {
  const factory Sessions({
    required String id,
    required String title,
    required String description,
    @RequiredDateTimeConverter() required DateTime startsAt,
    @RequiredDateTimeConverter() required DateTime endsAt,
    required String venueId,
    int? sponsorId,
    @Default(false) bool isLightningTalk,
    @Default(false) bool isBeginnersLightningTalk,
    @Default(false) bool isHandsOn,
    String? videoUrl,
    String? url,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _Sessions;

  factory Sessions.fromJson(Map<String, dynamic> json) =>
      _$SessionsFromJson(json);
}
