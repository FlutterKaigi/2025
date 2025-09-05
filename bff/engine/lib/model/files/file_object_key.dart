import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_object_key.freezed.dart';
part 'file_object_key.g.dart';

@Freezed(unionKey: 'type')
sealed class FileObjectKey with _$FileObjectKey {
  const FileObjectKey._();

  const factory FileObjectKey.avatar({
    required String userId,
    required String uuid,
    required String extension,
  }) = FileObjectAvatarKey;

  factory FileObjectKey.fromJson(Map<String, dynamic> json) =>
      _$FileObjectKeyFromJson(json);

  factory FileObjectKey.parse(String key) {
    final parts = key.split('/');
    if (parts.length != 3) {
      throw ArgumentError('Invalid key format: $key');
    }

    final type = parts[0];
    final userId = parts[1];
    final fileName = parts[2];

    return switch (type) {
      'avatar' => FileObjectAvatarKey(
        userId: userId,
        uuid: fileName.split('.').first,
        extension: fileName.split('.').last,
      ),
      _ => throw ArgumentError('Invalid key format: $key'),
    };
  }

  String objectKey() {
    return switch (this) {
      FileObjectAvatarKey() => 'avatar/$userId/$uuid.$extension',
    };
  }
}
