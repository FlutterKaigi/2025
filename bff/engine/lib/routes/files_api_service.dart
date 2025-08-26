import 'dart:convert';

import 'package:bff_client/bff_client.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'files_api_service.g.dart';

class FilesApiService {
  @Route.post('/upload')
  Future<Response> _uploadFile(Request request) async => jsonResponse(() async {
    final supabaseUtil = container.read(supabaseUtilProvider);
    final userResult = await supabaseUtil.extractUser(request);
    final (_, user, _) = userResult.unwrap;

    final body =
        jsonDecode(await request.readAsString()) as Map<String, dynamic>;
    final uploadRequest = FilesUploadRequest.fromJson(body);
    return const FilesUploadResponse(
      url: 'https://example.com',
      key: '1234567890',
    ).toJson();
  });

  Router get router => _$FilesApiServiceRouter(this);
}
