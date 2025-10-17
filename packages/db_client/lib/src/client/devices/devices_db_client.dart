import 'package:db_client/db_client.dart';
import 'package:db_types/db_types.dart';

class DevicesDbClient {
  const DevicesDbClient({
    required Executor executor,
  }) : _executor = executor;

  final Executor _executor;

  Future<List<Devices>> getAllDevices() async {
    final result = await _executor.execute(
      '''
      SELECT *
      FROM devices
      ORDER BY created_at DESC
      ''',
    );
    return result.map((e) => Devices.fromJson(e.toColumnMap())).toList();
  }

  Future<Devices?> getDeviceById(String deviceId) async {
    final result = await _executor.execute(
      '''
      SELECT *
      FROM devices
      WHERE id = @deviceId
      ''',
      parameters: {
        'deviceId': deviceId,
      },
    );
    final element = result.firstOrNull?.toColumnMap();
    if (element == null) {
      return null;
    }
    return Devices.fromJson(element);
  }

  Future<List<Devices>> getDevicesByUserId({required String userId}) async {
    final result = await _executor.execute(
      '''
      SELECT *
      FROM devices
      WHERE user_id = @userId
      ''',
      parameters: {
        'userId': userId,
      },
    );
    return result.map((e) => Devices.fromJson(e.toColumnMap())).toList();
  }

  Future<Devices> upsertDevice({
    required UpsertDevice upsertDevice,
  }) async {
    final result = await _executor.execute(
      '''
      INSERT INTO devices (id, user_id, type, name)
      VALUES (@id, @userId, @type, @name)
      ON CONFLICT (id) DO UPDATE SET
        user_id = @userId,
        type = @type,
        name = @name,
        updated_at = NOW()
      RETURNING *
      ''',
      parameters: upsertDevice.toJson(),
    );
    return Devices.fromJson(result.first.toColumnMap());
  }

  Future<void> deleteDevice({
    required String deviceId,
  }) async {
    await _executor.execute(
      '''
      DELETE FROM devices
      WHERE id = @deviceId
      ''',
      parameters: {
        'deviceId': deviceId,
      },
    );
  }

  Future<List<DeviceTokens>> getAllDeviceTokens() async {
    final result = await _executor.execute(
      '''
      SELECT device, apns_token, fcm_token, apns_live_activity_tokens
      FROM v_device_tokens
      ORDER BY created_at DESC
      ''',
    );
    return result.map((e) => DeviceTokens.fromJson(e.toColumnMap())).toList();
  }

  Future<DeviceTokens?> getDeviceTokenById(String deviceId) async {
    final result = await _executor.execute(
      '''
      SELECT device, apns_token, fcm_token, apns_live_activity_tokens
      FROM v_device_tokens
      WHERE device_id = @deviceId
      ''',
      parameters: {
        'deviceId': deviceId,
      },
    );
    final element = result.firstOrNull?.toColumnMap();
    if (element == null) {
      return null;
    }
    return DeviceTokens.fromJson(element);
  }

  Future<List<DeviceTokens>> getDeviceTokensByUserId({
    required String userId,
  }) async {
    final result = await _executor.execute(
      '''
      SELECT device, apns_token, fcm_token, apns_live_activity_tokens
      FROM v_device_tokens
      WHERE user_id = @userId
      ORDER BY created_at DESC
      ''',
      parameters: {
        'userId': userId,
      },
    );
    return result.map((e) => DeviceTokens.fromJson(e.toColumnMap())).toList();
  }
}
