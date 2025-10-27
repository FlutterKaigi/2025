import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:engine/feature/websocket/model/websocket_ticket_sign_request.dart';
import 'package:engine/feature/websocket/provider/jwt_secret_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'websocket_ticket_repository.g.dart';

@Riverpod(keepAlive: true)
WebsocketTicketRepository websocketTicketRepository(Ref ref) =>
    WebsocketTicketRepository(
      jwtKey: ref.watch(jwtSecretProvider),
    );

class WebsocketTicketRepository {
  const WebsocketTicketRepository({required JWTKey jwtKey}) : _jwtKey = jwtKey;

  final JWTKey _jwtKey;

  Future<String> generateTicket({
    required WebsocketTicketSignRequest request,
  }) async {
    if (request is WebsocketTicketSignRequestUser) {
      return JWT(
        <String, dynamic>{
          'type': 'USER',
        },
        issuer: 'https://github.com/FlutterKaigi/2025',
        subject: request.userId,
      ).sign(
        _jwtKey,
        algorithm: JWTAlgorithm.ES256,
        expiresIn: request.expiration,
      );
    }

    throw UnimplementedError('Unsupported request type: $request');
  }
}
