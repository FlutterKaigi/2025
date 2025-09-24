import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:db_types/src/models/sponsors.dart';
import 'package:db_types/src/tables/speakers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_venues_with_sessions.freezed.dart';
part 'session_venues_with_sessions.g.dart';

@freezed
abstract class SessionVenuesWithSessions with _$SessionVenuesWithSessions {
  const factory SessionVenuesWithSessions({
    required String id,
    required String name,
    @Default([]) List<SessionWithDetails> sessions,
  }) = _SessionVenuesWithSessions;

  factory SessionVenuesWithSessions.fromJson(Map<String, dynamic> json) =>
      _$SessionVenuesWithSessionsFromJson(json);
}

@freezed
abstract class SessionWithDetails with _$SessionWithDetails {
  const factory SessionWithDetails({
    required String id,
    required String title,
    required String description,
    @RequiredDateTimeConverter() required DateTime startsAt,
    @RequiredDateTimeConverter() required DateTime endsAt,
    @Default(false) bool isLightningTalk,
    @Default(false) bool isBeginnersLightningTalk,
    @Default(false) bool isHandsOn,
    String? videoUrl,
    @Default([]) List<Speakers> speakers,
    CompanySponsorDetail? sponsor,
  }) = _SessionWithDetails;

  factory SessionWithDetails.fromJson(Map<String, dynamic> json) =>
      _$SessionWithDetailsFromJson(json);
}
