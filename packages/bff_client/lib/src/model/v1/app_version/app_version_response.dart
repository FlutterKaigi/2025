import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_version_response.freezed.dart';
part 'app_version_response.g.dart';

@freezed
abstract class AppVersionResponse with _$AppVersionResponse {
  const factory AppVersionResponse({
    @JsonKey(name: 'minimum_version') required String minimumVersion,
    @JsonKey(name: 'store_urls') required Map<String, String> storeUrls,
    required Map<String, String> message,
  }) = _AppVersionResponse;

  factory AppVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$AppVersionResponseFromJson(json);
}
