import 'package:bff_client/src/model/v1/session/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_detail_response.freezed.dart';
part 'session_detail_response.g.dart';

@freezed
abstract class SessionDetailResponse with _$SessionDetailResponse {
  const factory SessionDetailResponse({
    required String id,
    required String title,
    required String description,
    required DateTime startsAt,
    required DateTime endsAt,
    required bool isLightningTalk,
    required bool isBeginnersLightningTalk,
    required bool isHandsOn,
    required List<Speaker> speakers,
    String? videoUrl,
    String? url,
    Sponsor? sponsor,
  }) = _SessionDetailResponse;

  factory SessionDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionDetailResponseFromJson(json);
}
