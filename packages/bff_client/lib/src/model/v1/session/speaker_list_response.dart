import 'package:bff_client/src/model/v1/session/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'speaker_list_response.freezed.dart';
part 'speaker_list_response.g.dart';

@freezed
abstract class SpeakerListResponse with _$SpeakerListResponse {
  const factory SpeakerListResponse({
    required List<Speaker> speakers,
  }) = _SpeakerListResponse;

  factory SpeakerListResponse.fromJson(Map<String, dynamic> json) =>
      _$SpeakerListResponseFromJson(json);
}
