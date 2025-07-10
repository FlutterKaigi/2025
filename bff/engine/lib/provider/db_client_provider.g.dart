// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'db_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(dbClient)
const dbClientProvider = DbClientFamily._();

final class DbClientProvider
    extends $FunctionalProvider<AsyncValue<DbClient>, FutureOr<DbClient>>
    with $FutureModifier<DbClient>, $FutureProvider<DbClient> {
  const DbClientProvider._({
    required DbClientFamily super.from,
    required HyperdriveType super.argument,
  }) : super(
         retry: null,
         name: r'dbClientProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dbClientHash();

  @override
  String toString() {
    return r'dbClientProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<DbClient> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DbClient> create(Ref ref) {
    final argument = this.argument as HyperdriveType;
    return dbClient(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DbClientProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dbClientHash() => r'aa63e76f0b46cfe2b46ba38025eae4149bc99bf6';

final class DbClientFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<DbClient>, HyperdriveType> {
  const DbClientFamily._()
    : super(
        retry: null,
        name: r'dbClientProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  DbClientProvider call(HyperdriveType type) =>
      DbClientProvider._(argument: type, from: this);

  @override
  String toString() => r'dbClientProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
