import 'package:bff_client/src/model/v1/session/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_list_response.freezed.dart';
part 'session_list_response.g.dart';

@freezed
abstract class SessionListResponse with _$SessionListResponse {
  const factory SessionListResponse({
    required List<Session> sessions,
  }) = _SessionListResponse;

  factory SessionListResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionListResponseFromJson(json);
}
