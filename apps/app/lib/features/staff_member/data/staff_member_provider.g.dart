// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'staff_member_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(staffMembers)
const staffMembersProvider = StaffMembersProvider._();

final class StaffMembersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<StaffMemberWithSnsLinks>>,
          List<StaffMemberWithSnsLinks>,
          FutureOr<List<StaffMemberWithSnsLinks>>
        >
    with
        $FutureModifier<List<StaffMemberWithSnsLinks>>,
        $FutureProvider<List<StaffMemberWithSnsLinks>> {
  const StaffMembersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'staffMembersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$staffMembersHash();

  @$internal
  @override
  $FutureProviderElement<List<StaffMemberWithSnsLinks>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<StaffMemberWithSnsLinks>> create(Ref ref) {
    return staffMembers(ref);
  }
}

String _$staffMembersHash() => r'8e514249a36686442d548b932f1f98f9e3dcddf8';
