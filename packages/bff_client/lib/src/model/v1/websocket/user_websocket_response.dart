import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_websocket_response.freezed.dart';
part 'user_websocket_response.g.dart';

@freezed
abstract class UserWebsocketResponse with _$UserWebsocketResponse {
  const factory UserWebsocketResponse({
    required String url,
    required String ticket,
    required int expiration,
    required DateTime responseAt,
  }) = _UserWebsocketResponse;

  factory UserWebsocketResponse.fromJson(Map<String, dynamic> json) =>
      _$UserWebsocketResponseFromJson(json);
}
