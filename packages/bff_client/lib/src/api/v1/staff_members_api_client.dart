import 'package:db_types/db_types.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'staff_members_api_client.g.dart';

@RestApi()
abstract class StaffMembersApiClient {
  factory StaffMembersApiClient(Dio dio, {String? baseUrl}) =
      _StaffMembersApiClient;

  /// スタッフメンバー一覧を取得
  @GET('/staff-members')
  Future<List<StaffMemberWithSnsLinks>> getStaffMembers();
}
