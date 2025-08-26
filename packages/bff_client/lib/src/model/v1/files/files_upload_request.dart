import 'package:freezed_annotation/freezed_annotation.dart';

part 'files_upload_request.freezed.dart';
part 'files_upload_request.g.dart';

@freezed
abstract class FilesUploadRequest with _$FilesUploadRequest {
  const factory FilesUploadRequest({
    required FileVariant variant,
    required int contentLength,
  }) = _FilesUploadRequest;

  factory FilesUploadRequest.fromJson(Map<String, dynamic> json) =>
      _$FilesUploadRequestFromJson(json);
}

enum FileVariant {
  avatar,
}
