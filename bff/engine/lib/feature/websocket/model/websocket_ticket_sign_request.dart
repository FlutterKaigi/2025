import 'package:freezed_annotation/freezed_annotation.dart';

part 'websocket_ticket_sign_request.freezed.dart';
part 'websocket_ticket_sign_request.g.dart';

@Freezed(unionKey: 'type')
sealed class WebsocketTicketSignRequest with _$WebsocketTicketSignRequest {
  const factory WebsocketTicketSignRequest.user({
    required String userId,
    @DurationInSecondsConverter() required Duration expiration,
  }) = WebsocketTicketSignRequestUser;

  factory WebsocketTicketSignRequest.fromJson(Map<String, dynamic> json) =>
      _$WebsocketTicketSignRequestFromJson(json);
}

class DurationInSecondsConverter implements JsonConverter<Duration, int> {
  const DurationInSecondsConverter();

  @override
  Duration fromJson(int json) => Duration(seconds: json);

  @override
  int toJson(Duration object) => object.inSeconds;
}
