import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_upload_response.freezed.dart';
part 'file_upload_response.g.dart';

@freezed
abstract class FileUploadResponse with _$FileUploadResponse {
  const factory FileUploadResponse({
    /// 署名付きURL
    required String url,
    /// ファイルのアップロード先で保存されるオブジェクトストレージのキー
    required String key,
  }) = _FileUploadResponse;

  factory FileUploadResponse.fromJson(Map<String, dynamic> json) =>
    _$FileUploadResponseFromJson(json);
}
