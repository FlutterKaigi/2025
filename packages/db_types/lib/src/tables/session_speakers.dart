import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_speakers.freezed.dart';
part 'session_speakers.g.dart';

@freezed
abstract class SessionSpeakers with _$SessionSpeakers {
  const factory SessionSpeakers({
    required String sessionId,
    required String speakerId,
  }) = _SessionSpeakers;

  factory SessionSpeakers.fromJson(Map<String, dynamic> json) =>
      _$SessionSpeakersFromJson(json);
}
