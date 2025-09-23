import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_version_response.freezed.dart';
part 'app_version_response.g.dart';

@freezed
abstract class AppVersionResponse with _$AppVersionResponse {
  const factory AppVersionResponse({
    @JsonKey(name: 'minimum_version') required PlatformMap minimumVersion,
    @JsonKey(name: 'store_urls') required PlatformMap storeUrls,
    required Map<String, String> message,
  }) = _AppVersionResponse;

  factory AppVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$AppVersionResponseFromJson(json);
}

@freezed
abstract class PlatformMap with _$PlatformMap {
  const factory PlatformMap({
    required String ios,
    required String android,
  }) = _PlatformMap;

  factory PlatformMap.fromJson(Map<String, dynamic> json) =>
      _$PlatformMapFromJson(json);
}
