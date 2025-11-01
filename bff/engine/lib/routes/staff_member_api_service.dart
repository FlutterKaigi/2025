import 'package:db_types/db_types.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'staff_member_api_service.g.dart';

class StaffMemberApiService {
  /// スタッフメンバー一覧を取得
  @Route.get('/staff-members')
  Future<Response> _getStaffMembers(Request request) async => jsonResponse(
    () async {
      final database = await container.read(
        dbClientProvider.future,
      );
      final staffMembers = await database.staffMember
          .getStaffMembersWithSnsLinks();

      return StaffMemberListResponse(
        staffMembers: staffMembers,
      ).toJson();
    },
  );

  Router get router => _$StaffMemberApiServiceRouter(this);
}
