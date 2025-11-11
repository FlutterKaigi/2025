import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_websocket_response.freezed.dart';
part 'send_websocket_response.g.dart';

@freezed
abstract class SendWebsocketResponse with _$SendWebsocketResponse {
  const factory SendWebsocketResponse({
    required String code,
    required String message,
    required int count,
  }) = _SendWebsocketResponse;

  factory SendWebsocketResponse.fromJson(Map<String, dynamic> json) =>
      _$SendWebsocketResponseFromJson(json);
}
