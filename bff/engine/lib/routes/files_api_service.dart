import 'dart:convert';

import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/exception_handler.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'files_api_service.g.dart';

class FilesApiService {
  @Route.post('upload')
  Future<Response> _uploadFile() async => jsonResponse(
    () async {
      final request = request.;
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, user, _) = userResult.unwrap;

      final body = jsonDecode(await request.readAsString()) as Map<String, dynamic>;
      final uploadRequest = FilesUploadRequest.fromJson(body);

    }
  );
}
