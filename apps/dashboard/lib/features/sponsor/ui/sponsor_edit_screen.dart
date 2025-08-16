import 'package:dashboard/core/gen/l10n/l10n.dart';
import 'package:dashboard/features/sponsor/data/sponsor.dart';
import 'package:dashboard/features/sponsor/data/sponsor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// スポンサー編集画面
///
/// 主な役割:
/// - スポンサー企業情報の編集を行う
/// - 詳細画面から遷移して利用される
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class SponsorEditScreen extends HookConsumerWidget {
  const SponsorEditScreen({
    required this.slug,
    super.key,
  });

  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final sponsor = ref.watch(
      sponsorsProvider.select(
        (s) {
          return switch (s) {
            AsyncData(:final value) => value.firstWhere((s) => s.slug == slug),
            _ => null,
          };
        },
      ),
    );

    if (sponsor == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.sponsorEditScreenTitle),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return _SponsorEditForm(sponsor: sponsor);
  }
}

class _SponsorEditForm extends HookConsumerWidget {
  const _SponsorEditForm({
    required this.sponsor,
  });

  final Sponsor sponsor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final websiteController = useTextEditingController();
    final xAccountController = useTextEditingController();

    useEffect(() {
      nameController.text = sponsor.name;
      switch (sponsor) {
        case final CompanySponsor company:
          descriptionController.text = company.prText;
          websiteController.text = company.websiteUrl.toString();
        case final IndividualSponsor individual:
          descriptionController.text = individual.enthusiasm ?? '';
          xAccountController.text = individual.xAccount ?? '';
      }
      return null;
    }, [sponsor]);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: Text(l10n.sponsorEditScreenTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // スポンサー名
            _SponsorEditField(
              controller: nameController,
              label: l10n.sponsorName,
            ),
            const SizedBox(height: 16),

            // 会社概要/意気込み
            _SponsorEditField(
              controller: descriptionController,
              label: switch (sponsor) {
                CompanySponsor() => l10n.sponsorPrText,
                IndividualSponsor() => l10n.sponsorEnthusiasm,
              },
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            // ウェブサイト（企業スポンサーの場合）
            if (sponsor is CompanySponsor) ...[
              _SponsorEditField(
                controller: websiteController,
                label: l10n.sponsorWebsite,
              ),
              const SizedBox(height: 16),
            ],

            // Xアカウント（個人スポンサーの場合）
            if (sponsor is IndividualSponsor) ...[
              _SponsorEditField(
                controller: xAccountController,
                label: l10n.sponsorXAccount,
              ),
              const SizedBox(height: 16),
            ],
            const SizedBox(height: 80), // ボタン分のスペースを確保
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.onPrimaryContainer,
              foregroundColor: colorScheme.onPrimary,
            ),
            icon: const Icon(Icons.check),
            label: Text(l10n.sponsorEditSaveButtonLabel),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class _SponsorEditField extends HookWidget {
  const _SponsorEditField({
    required this.controller,
    required this.label,
    this.hint,
    this.maxLines = 1,
    this.maxLength,
  });

  final TextEditingController controller;
  final String label;
  final int maxLines;
  final String? hint;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasText = useState(controller.text.isNotEmpty);

    useEffect(() {
      void listener() {
        hasText.value = controller.text.isNotEmpty;
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller]);

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.3,
        ),
        counterText: maxLength != null ? '' : null, // カウンターを非表示
        suffixIcon: hasText.value
            ? IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: colorScheme.onSurfaceVariant,
                  size: 20,
                ),
                onPressed: () {
                  controller.clear();
                  hasText.value = false;
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.outline,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
