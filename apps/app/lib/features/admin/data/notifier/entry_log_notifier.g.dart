// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'entry_log_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 入場履歴を管理するNotifier

@ProviderFor(EntryLogManager)
const entryLogManagerProvider = EntryLogManagerProvider._();

/// 入場履歴を管理するNotifier
final class EntryLogManagerProvider
    extends $AsyncNotifierProvider<EntryLogManager, void> {
  /// 入場履歴を管理するNotifier
  const EntryLogManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'entryLogManagerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$entryLogManagerHash();

  @$internal
  @override
  EntryLogManager create() => EntryLogManager();
}

String _$entryLogManagerHash() => r'6e803762a577350d75aeaba276bd76a0e16012aa';

/// 入場履歴を管理するNotifier

abstract class _$EntryLogManager extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
