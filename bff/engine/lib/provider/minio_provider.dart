import 'package:engine/provider/environments_provider.dart';
import 'package:minio/minio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'minio_provider.g.dart';

@Riverpod(keepAlive: true)
Minio minio(Ref ref) {
  final environments = ref.watch(environmentsProvider);
  return Minio(
    endPoint:
        'https://${environments.cloudflareAccountId}.r2.cloudflarestorage.com',
    region: 'auto',
    accessKey: environments.r2AccessKeyId,
    secretKey: environments.r2SecretAccessKey,
    enableTrace: true,
  );
}
