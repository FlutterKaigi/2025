import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'files_api_client.g.dart';

@RestApi()
abstract class FilesApiClient {
  factory FilesApiClient(Dio dio, {String baseUrl}) = _FilesApiClient;

  /// ファイルアップロード用の署名付きURLを取得します
  /// Authorization Headerが必須
  @POST('/files/upload')
  Future<HttpResponse<FilesUploadResponse>> getUploadUrl({
    @Body() required FilesUploadRequest request,
  });
}
