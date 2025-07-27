import 'package:freezed_annotation/freezed_annotation.dart';

part 'container_instance_status.freezed.dart';
part 'container_instance_status.g.dart';

@freezed
abstract class ContainerInstanceStatus with _$ContainerInstanceStatus {
  const factory ContainerInstanceStatus({
    required ContainerInstanceStatusEnum status,
    String? error,
    Map<String, dynamic>? output,
  }) = _ContainerInstanceStatus;

  factory ContainerInstanceStatus.fromJson(Map<String, dynamic> json) =>
      _$ContainerInstanceStatusFromJson(json);
}

@JsonEnum()
enum ContainerInstanceStatusEnum {
  @JsonValue('queued')
  queued,
  @JsonValue('running')
  running,
  @JsonValue('paused')
  paused,
  @JsonValue('errored')
  errored,
  @JsonValue('terminated')
  terminated,
  @JsonValue('complete')
  complete,
  @JsonValue('waiting')
  waiting,
  @JsonValue('waitingForPause')
  waitingForPause,
  @JsonValue('unknown')
  unknown,
}
