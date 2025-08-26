import 'package:dio/dio.dart';
import 'package:internal_api_client/src/api/r2_internal_api/model/create_signed_url_request.dart';
import 'package:internal_api_client/src/api/r2_internal_api/model/create_signed_url_response.dart';
import 'package:internal_api_client/src/api/r2_internal_api/model/delete_object_request.dart';
import 'package:internal_api_client/src/api/r2_internal_api/model/delete_object_response.dart';
import 'package:retrofit/retrofit.dart';

part 'r2_api_client.g.dart';

@RestApi()
abstract class R2ApiClient {
  factory R2ApiClient(Dio dio, {String baseUrl}) = _R2ApiClient;

  @PUT('/proxy/r2-internal-api/internal/r2/signed-url')
  Future<HttpResponse<CreateSignedUrlResponse>> createSignedUrl({
    @Body() required CreateSignedUrlRequest request,
  });

  @DELETE('/proxy/r2-internal-api/internal/r2/object')
  Future<HttpResponse<DeleteObjectResponse>> deleteObject({
    @Body() required DeleteObjectRequest request,
  });
}