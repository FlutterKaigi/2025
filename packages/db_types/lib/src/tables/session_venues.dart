import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_venues.freezed.dart';
part 'session_venues.g.dart';

@freezed
abstract class SessionVenues with _$SessionVenues {
  const factory SessionVenues({
    required String id,
    required String name,
  }) = _SessionVenues;

  factory SessionVenues.fromJson(Map<String, dynamic> json) =>
      _$SessionVenuesFromJson(json);
}
