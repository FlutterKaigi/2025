import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:db_types/src/models/sponsors.dart';
import 'package:db_types/src/tables/session_venues.dart';
import 'package:db_types/src/tables/speakers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sponsor_with_sessions.freezed.dart';
part 'sponsor_with_sessions.g.dart';

@freezed
abstract class SponsorWithSessions with _$SponsorWithSessions {
  const factory SponsorWithSessions({
    required CompanySponsorDetail sponsor,
    @Default([]) List<SponsorSessionDetail> sessions,
  }) = _SponsorWithSessions;

  factory SponsorWithSessions.fromJson(Map<String, dynamic> json) =>
      _$SponsorWithSessionsFromJson(json);
}

@freezed
abstract class SponsorSessionDetail with _$SponsorSessionDetail {
  const factory SponsorSessionDetail({
    required String id,
    required String title,
    required String description,
    @RequiredDateTimeConverter() required DateTime startsAt,
    @RequiredDateTimeConverter() required DateTime endsAt,
    @Default(false) bool isLightningTalk,
    @Default(false) bool isBeginnersLightningTalk,
    @Default(false) bool isHandsOn,
    String? videoUrl,
    String? url,
    @Default([]) List<Speakers> speakers,
    SessionVenues? venue,
  }) = _SponsorSessionDetail;

  factory SponsorSessionDetail.fromJson(Map<String, dynamic> json) =>
      _$SponsorSessionDetailFromJson(json);
}
