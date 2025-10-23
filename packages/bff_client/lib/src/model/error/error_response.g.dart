// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ErrorResponse', json, ($checkedConvert) {
      final val = _ErrorResponse(
        code: $checkedConvert(
          'code',
          (v) => $enumDecode(
            _$ErrorCodeEnumMap,
            v,
            unknownValue: ErrorCode.unknownEnumField,
          ),
        ),
        message: $checkedConvert('message', (v) => v as String),
        detail: $checkedConvert('detail', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ErrorResponseToJson(_ErrorResponse instance) =>
    <String, dynamic>{
      'code': _$ErrorCodeEnumMap[instance.code]!,
      'message': instance.message,
      'detail': instance.detail,
    };

const _$ErrorCodeEnumMap = {
  ErrorCode.unauthorized: 'UNAUTHORIZED',
  ErrorCode.forbidden: 'FORBIDDEN',
  ErrorCode.notFound: 'NOT_FOUND',
  ErrorCode.conflict: 'CONFLICT',
  ErrorCode.notImplemented: 'NOT_IMPLEMENTED',
  ErrorCode.internalServerError: 'INTERNAL_SERVER_ERROR',
  ErrorCode.routeNotFound: 'ROUTE_NOT_FOUND',
  ErrorCode.badRequest: 'BAD_REQUEST',
  ErrorCode.proxyError: 'PROXY_ERROR',
  ErrorCode.rateLimitExceeded: 'RATE_LIMIT_EXCEEDED',
  ErrorCode.unknownEnumField: 'UNKNOWN_ENUM_FIELD',
};
