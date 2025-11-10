import 'dart:async';

import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/assets/fonts.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/licenses/data/provider/licenses_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LicenseScreen extends HookConsumerWidget {
  const LicenseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    final searchController = useSearchController();
    final licensesState = ref.watch(licensesProvider);

    return switch (licensesState) {
      AsyncLoading() => Scaffold(
        appBar: AppBar(
          title: Text(t.license.title),
        ),
        body: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
      AsyncError(:final error) => Scaffold(
        appBar: AppBar(
          title: Text(t.license.title),
        ),
        body: ErrorScreen(
          error: error,
          onRetry: () => ref.invalidate(licensesProvider),
        ),
      ),
      AsyncData(value: final licenses) => () {
        final primaryScrollController = PrimaryScrollController.of(context);
        void onPressed() {
          if (context.mounted) {
            searchController.clear();
            unawaited(HapticFeedback.selectionClick());
          }
        }

        return Scaffold(
          body: Scrollbar(
            controller: primaryScrollController,
            child: CustomScrollView(
              controller: primaryScrollController,
              slivers: [
                SliverAppBar(
                  title: Text(t.license.title),
                  floating: true,
                  elevation: 4,
                  scrolledUnderElevation: 4,
                  backgroundColor: theme.colorScheme.surfaceContainer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SearchAnchor.bar(
                        searchController: searchController,
                        viewHintText: t.license.search.hintText,
                        barHintText: t.license.search.hintText,
                        barTrailing: [
                          IconButton(
                            onPressed: onPressed,
                            icon: const Icon(Icons.clear),
                          ),
                        ],
                        viewTrailing: [
                          IconButton(
                            onPressed: onPressed,
                            icon: const Icon(Icons.clear),
                          ),
                        ],
                        barTextStyle: WidgetStatePropertyAll(
                          theme.textTheme.bodyMedium!.copyWith(
                            fontFamily: FontFamily.notoSansMono,
                            fontFamilyFallback: [FontFamily.notoSansMono],
                          ),
                        ),
                        suggestionsBuilder: (context, controller) async {
                          final searchText = controller.value.text;

                          final iterable = <Widget>[];
                          for (final entry in licenses.entries) {
                            final package = entry.key;
                            if (searchText.isNotEmpty &&
                                !package.contains(searchText)) {
                              continue;
                            }
                            iterable.add(
                              _LicenseTile(
                                package: package,
                                licenseCount: entry.value.length,
                              ),
                            );
                          }
                          return iterable;
                        },
                        onClose: () => FocusScope.of(context).unfocus(),
                      ),
                    ),
                  ),
                ),
                SliverSafeArea(
                  top: false,
                  sliver: SliverList.builder(
                    itemCount: licenses.length,
                    itemBuilder: (context, index) {
                      final entry = licenses.entries.elementAt(index);
                      return _LicenseTile(
                        package: entry.key,
                        licenseCount: entry.value.length,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }(),
    };
  }
}

class _LicenseTile extends StatelessWidget {
  const _LicenseTile({
    required this.package,
    required this.licenseCount,
  });

  final String package;
  final int licenseCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = Translations.of(context);

    return ListTile(
      title: Text(
        package,
        style: theme.textTheme.bodyMedium!.copyWith(
          fontFamily: FontFamily.notoSansMono,
        ),
      ),
      subtitle: Text(
        t.license.listTile.description(
          n: licenseCount,
        ),
      ),
      visualDensity: VisualDensity.compact,
      onTap: () => LicenseDetailRoute(
        package: package,
      ).push<void>(context),
    );
  }
}
