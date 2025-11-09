import 'package:app/core/api/api_exception.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'staff_member_provider.g.dart';

@riverpod
Future<List<StaffMemberWithSnsLinks>> staffMembers(Ref ref) async {
  final bffClient = ref.watch(bffClientProvider);
  final staffMembers = await ApiException.transform(
    () => bffClient.v1.staffMembers.getStaffMembers(),
  );
  return staffMembers;
}
