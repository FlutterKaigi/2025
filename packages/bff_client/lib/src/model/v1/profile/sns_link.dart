import 'package:db_types/db_types.dart' as db;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sns_link.freezed.dart';
part 'sns_link.g.dart';

@freezed
abstract class SnsLink with _$SnsLink {
  const factory SnsLink({
    required SnsType snsType,
    required String value,
  }) = _SnsLink;

  factory SnsLink.fromJson(Map<String, dynamic> json) =>
      _$SnsLinkFromJson(json);
}

enum SnsType {
  github,
  x,
  discord,
  medium,
  qiita,
  zenn,
  note,
  other,
}

extension DbUserSnsLinksToSnsLink on db.UserSnsLinks {
  SnsLink toSnsLink() => SnsLink(
    snsType: switch (snsType) {
      db.SnsType.github => SnsType.github,
      db.SnsType.x => SnsType.x,
      db.SnsType.discord => SnsType.discord,
      db.SnsType.medium => SnsType.medium,
      db.SnsType.qiita => SnsType.qiita,
      db.SnsType.zenn => SnsType.zenn,
      db.SnsType.note => SnsType.note,
      db.SnsType.other => SnsType.other,
    },
    value: value,
  );
}

extension SnsTypeToDbSnsType on SnsType {
  db.SnsType toDbSnsType() => switch (this) {
    SnsType.github => db.SnsType.github,
    SnsType.x => db.SnsType.x,
    SnsType.discord => db.SnsType.discord,
    SnsType.medium => db.SnsType.medium,
    SnsType.qiita => db.SnsType.qiita,
    SnsType.zenn => db.SnsType.zenn,
    SnsType.note => db.SnsType.note,
    SnsType.other => db.SnsType.other,
  };
}
