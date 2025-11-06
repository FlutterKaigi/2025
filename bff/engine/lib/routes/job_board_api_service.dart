import 'package:bff_client/bff_client.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'job_board_api_service.g.dart';

final class JobBoardApiService {
  @Route.get('/job-boards')
  Future<Response> _getJobBoards(Request request) async => jsonResponseList(
    () async {
      final database = await container.read(
        dbClientProvider.future,
      );

      final jobBoards = await database.jobBoard.getJobBoards();
      return jobBoards
          .map(
            (j) => JobBoard(
              id: j.id,
              url: j.url,
              altText: j.altText,
              imageUrl: j.imageUrl,
            ).toJson(),
          )
          .toList();
    },
  );

  Router get router => _$JobBoardApiServiceRouter(this);
}
