// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'container_instance_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContainerInstanceStatus _$ContainerInstanceStatusFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ContainerInstanceStatus', json, ($checkedConvert) {
  final val = _ContainerInstanceStatus(
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$ContainerInstanceStatusEnumEnumMap, v),
    ),
    error: $checkedConvert('error', (v) => v as String?),
    output: $checkedConvert('output', (v) => v as Map<String, dynamic>?),
  );
  return val;
});

Map<String, dynamic> _$ContainerInstanceStatusToJson(
  _ContainerInstanceStatus instance,
) => <String, dynamic>{
  'status': _$ContainerInstanceStatusEnumEnumMap[instance.status]!,
  'error': instance.error,
  'output': instance.output,
};

const _$ContainerInstanceStatusEnumEnumMap = {
  ContainerInstanceStatusEnum.queued: 'queued',
  ContainerInstanceStatusEnum.running: 'running',
  ContainerInstanceStatusEnum.paused: 'paused',
  ContainerInstanceStatusEnum.errored: 'errored',
  ContainerInstanceStatusEnum.terminated: 'terminated',
  ContainerInstanceStatusEnum.complete: 'complete',
  ContainerInstanceStatusEnum.waiting: 'waiting',
  ContainerInstanceStatusEnum.waitingForPause: 'waitingForPause',
  ContainerInstanceStatusEnum.unknown: 'unknown',
};
