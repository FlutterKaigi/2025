import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/assets/fonts.gen.dart';
import 'package:app/features/licenses/data/provider/licenses_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LicenseDetailScreen extends StatelessWidget {
  const LicenseDetailScreen({required this.package, super.key});

  final String package;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          package,
          style: const TextStyle(
            fontFamily: FontFamily.notoSansMono,
          ),
          maxLines: 2,
        ),
        backgroundColor: theme.colorScheme.surfaceContainer,
      ),
      body: _Body(package: package),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({required this.package, super.key});

  final String package;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final licensesState = ref.watch(
      licensesProvider.select((v) => v.whenData((d) => d[package])),
    );
    return switch (licensesState) {
      AsyncLoading() => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      AsyncError(:final error) => ErrorScreen(
        error: error,
        onRetry: () => ref.invalidate(licensesProvider),
      ),
      AsyncData(value: final licenses)
          when licenses != null && licenses.isNotEmpty =>
        () {
          final licenseWidgets = useMemoized(() {
            final iterable = <Widget>[];
            for (final license in licenses) {
              iterable.add(
                const Divider(),
              );

              for (final paragraph in license) {
                if (paragraph.indent == LicenseParagraph.centeredIndent) {
                  iterable.add(
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        paragraph.text,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontFamily: FontFamily.notoSansMono,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  iterable.add(
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 8,
                        start: 8.0 * paragraph.indent,
                      ),
                      child: Text(
                        paragraph.text,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontFamily: FontFamily.notoSansMono,
                        ),
                      ),
                    ),
                  );
                }
              }
            }
            return iterable;
          }, [licenses]);

          return Scrollbar(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                primary: true,
                itemCount: licenseWidgets.length,
                itemBuilder: (context, index) {
                  final entry = licenseWidgets[index];
                  return entry;
                },
              ),
            ),
          );
        }(),
      AsyncData() => const SizedBox.shrink(),
    };
  }
}
