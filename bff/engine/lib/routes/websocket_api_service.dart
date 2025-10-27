import 'package:bff_client/bff_client.dart';
import 'package:clock/clock.dart';
import 'package:engine/feature/websocket/model/websocket_ticket_sign_request.dart';
import 'package:engine/feature/websocket/repository/websocket_ticket_repository.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/environments_provider.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'websocket_api_service.g.dart';

class WebsocketApiService {
  @Route.post('/start/user')
  Future<Response> _startWebSocket(Request request) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, user, _) = userResult.unwrap;

      final websocketTicketRepository = container.read(
        websocketTicketRepositoryProvider,
      );
      final now = clock.now();
      final ticket = await websocketTicketRepository.generateTicket(
        request: WebsocketTicketSignRequest.user(
          userId: user.id,
          expiration: const Duration(minutes: 5),
        ),
      );

      final websocketBaseUrl = container
          .read(environmentsProvider)
          .websocketBaseUrl;
      final uri = Uri.parse(websocketBaseUrl).resolve('ws?ticket=$ticket');

      return UserWebsocketResponse(
        url: uri.toString(),
        ticket: ticket,
        expiration: 5 * 60,
        responseAt: now,
      ).toJson();
    },
  );

  Router get router => _$WebsocketApiServiceRouter(this);
}
