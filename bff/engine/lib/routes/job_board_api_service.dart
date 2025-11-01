import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'job_board_api_service.g.dart';

final class JobBoardApiService {
  @Route.get('/job-boards')
  Future<Response> _getJobBoards(Request request) async => jsonResponse(
    () async {
      final database = await container.read(
        dbClientProvider.future,
      );

      try {
        final jobBoards = await database.jobBoard.getJobBoards();
        return {
          'job_boards': jobBoards.map((j) => j.toJson()).toList(),
        };
      } on Exception catch (e) {
        return {
          'error': 'Failed to fetch job boards',
          'message': e.toString(),
        };
      }
    },
  );

  Router get router => _$JobBoardApiServiceRouter(this);
}
