import 'package:freezed_annotation/freezed_annotation.dart';

part 'files_upload_response.freezed.dart';
part 'files_upload_response.g.dart';

@freezed
abstract class FilesUploadResponse with _$FilesUploadResponse {
  const factory FilesUploadResponse({
    /// 署名付きURL
    required String url,
    /// ファイルのアップロード先で保存されるオブジェクトストレージのキー
    required String key,
  }) = _FileUploadResponse;

  factory FilesUploadResponse.fromJson(Map<String, dynamic> json) =>
    _$FilesUploadResponseFromJson(json);
}
