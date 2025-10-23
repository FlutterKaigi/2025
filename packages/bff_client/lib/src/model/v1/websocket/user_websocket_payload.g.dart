// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_websocket_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserWebsocketProfileSharePayload _$UserWebsocketProfileSharePayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UserWebsocketProfileSharePayload',
  json,
  ($checkedConvert) {
    final val = UserWebsocketProfileSharePayload(
      profileShare: $checkedConvert(
        'profile_share',
        (v) => ProfileShareWebsocketPayload.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'profileShare': 'profile_share'},
);

Map<String, dynamic> _$UserWebsocketProfileSharePayloadToJson(
  UserWebsocketProfileSharePayload instance,
) => <String, dynamic>{'profile_share': instance.profileShare};
