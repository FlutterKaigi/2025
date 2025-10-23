// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'profile_share_websocket_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileShareAddWebsocketPayload _$ProfileShareAddWebsocketPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ProfileShareAddWebsocketPayload',
  json,
  ($checkedConvert) {
    final val = ProfileShareAddWebsocketPayload(
      profileWithSns: $checkedConvert(
        'profile_with_sns',
        (v) => ProfileWithSns.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'profileWithSns': 'profile_with_sns', r'$type': 'type'},
);

Map<String, dynamic> _$ProfileShareAddWebsocketPayloadToJson(
  ProfileShareAddWebsocketPayload instance,
) => <String, dynamic>{
  'profile_with_sns': instance.profileWithSns,
  'type': instance.$type,
};

ProfileShareUpdateWebsocketPayload _$ProfileShareUpdateWebsocketPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ProfileShareUpdateWebsocketPayload',
  json,
  ($checkedConvert) {
    final val = ProfileShareUpdateWebsocketPayload(
      profileWithSns: $checkedConvert(
        'profile_with_sns',
        (v) => ProfileWithSns.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'profileWithSns': 'profile_with_sns', r'$type': 'type'},
);

Map<String, dynamic> _$ProfileShareUpdateWebsocketPayloadToJson(
  ProfileShareUpdateWebsocketPayload instance,
) => <String, dynamic>{
  'profile_with_sns': instance.profileWithSns,
  'type': instance.$type,
};

ProfileShareDeleteWebsocketPayload _$ProfileShareDeleteWebsocketPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ProfileShareDeleteWebsocketPayload',
  json,
  ($checkedConvert) {
    final val = ProfileShareDeleteWebsocketPayload(
      profileId: $checkedConvert('profile_id', (v) => v as String),
      $type: $checkedConvert('type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'profileId': 'profile_id', r'$type': 'type'},
);

Map<String, dynamic> _$ProfileShareDeleteWebsocketPayloadToJson(
  ProfileShareDeleteWebsocketPayload instance,
) => <String, dynamic>{
  'profile_id': instance.profileId,
  'type': instance.$type,
};
