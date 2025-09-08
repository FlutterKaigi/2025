// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'change_avatar_action.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(changeAvatarAction)
const changeAvatarActionProvider = ChangeAvatarActionProvider._();

final class ChangeAvatarActionProvider
    extends
        $FunctionalProvider<
          ChangeAvatarAction,
          ChangeAvatarAction,
          ChangeAvatarAction
        >
    with $Provider<ChangeAvatarAction> {
  const ChangeAvatarActionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'changeAvatarActionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$changeAvatarActionHash();

  @$internal
  @override
  $ProviderElement<ChangeAvatarAction> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChangeAvatarAction create(Ref ref) {
    return changeAvatarAction(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChangeAvatarAction value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChangeAvatarAction>(value),
    );
  }
}

String _$changeAvatarActionHash() =>
    r'04c02a57b40c650da65091ddad309ea4cf87b5be';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
