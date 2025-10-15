import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/provider/environment.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/ticket/data/notifier/ticket_notifier.dart';
import 'package:app/features/ticket/data/provider/ticket_types_provider.dart';
import 'package:app/features/ticket/ui/components/ticket_card_description.dart';
import 'package:bff_client/bff_client.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketCheckoutSheet extends HookConsumerWidget {
  const TicketCheckoutSheet._({required this.ticketTypeId, super.key});

  final String ticketTypeId;

  static Future<void> show(BuildContext context, String ticketTypeId) =>
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        fullscreenDialog: true,
        builder: (context) => TicketCheckoutSheet._(ticketTypeId: ticketTypeId),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketTypesAsync = ref.watch(ticketTypesProvider);
    final t = Translations.of(context);
    final currentStep = useState(0);
    final selectedOptions = useState<Map<String, bool>>({});
    final isLoading = useState(false);

    final ticketTypeItem = ticketTypesAsync.value?.firstWhereOrNull(
      (item) => item.ticketType.id == ticketTypeId,
    );

    if (ticketTypeItem == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // 利用可能なオプション一覧を取得
    final options = ticketTypeItem.options.toList();

    // 総ステップ数を計算（チケット情報確認 + 各オプション + 決済確認）
    final totalSteps = 2 + options.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.ticket.purchase.title),
      ),
      body: Stepper(
        currentStep: currentStep.value,
        onStepTapped: (step) {
          if (step < currentStep.value) {
            currentStep.value = step;
          }
        },
        controlsBuilder: (context, details) {
          return _StepControls(
            details: details,
            currentStep: currentStep.value,
            totalSteps: totalSteps,
            availableOptions: options,
            selectedOptions: selectedOptions.value,
            isLoading: isLoading.value,
            onNext: () {
              if (currentStep.value < totalSteps - 1) {
                currentStep.value++;
              }
            },
            onCancel: () => Navigator.of(context).pop(),
            onCheckout: () async {
              isLoading.value = true;
              try {
                final notifier = ref.read(
                  ticketProvider.notifier,
                );
                final redirectUrl = _getRedirectUrl(ref);

                // チェック済みのオプションIDのみを送信
                final checkedOptionIds = selectedOptions.value.entries
                    .where((entry) => entry.value)
                    .map((entry) => entry.key)
                    .toList();

                final request = TicketCheckoutRequest(
                  ticketTypeId: ticketTypeId,
                  optionIds: checkedOptionIds,
                  successUrl: redirectUrl,
                  cancelUrl: redirectUrl,
                );

                final response = await notifier.createCheckout(request);

                // Stripe決済ページに遷移
                final uri = Uri.parse(response.session.stripeCheckoutUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                } else {
                  throw Exception(t.ticket.purchase.paymentPageError);
                }
              } on Exception catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${t.common.error.general.occurred}: '
                        '${e.errorMessage(t)}',
                      ),
                      backgroundColor: colorScheme.error,
                    ),
                  );
                }
              } finally {
                isLoading.value = false;
              }
            },
          );
        },
        steps: _buildSteps(
          currentStep: currentStep.value,
          ticketTypeItem: ticketTypeItem,
          availableOptions: options,
          selectedOptions: selectedOptions.value,
          onOptionChanged: (optionId, value) {
            selectedOptions.value = {
              ...selectedOptions.value,
              optionId: value,
            };
          },
        ),
      ),
    );
  }
}

// Stepの動的生成
List<Step> _buildSteps({
  required int currentStep,
  required TicketTypeWithOptionsItem ticketTypeItem,
  required List<TicketOption> availableOptions,
  required Map<String, bool> selectedOptions,
  // ignore: avoid_positional_boolean_parameters
  required void Function(String optionId, bool value) onOptionChanged,
}) {
  final steps = <Step>[];

  // Step 1: チケット情報確認
  steps.add(
    Step(
      title: Text(t.ticket.purchase.confirmTitle),
      content: _TicketInfoStep(ticketTypeItem: ticketTypeItem),
      isActive: currentStep == 0,
    ),
  );

  // Step 2〜N: 各オプション
  for (var i = 0; i < availableOptions.length; i++) {
    final option = availableOptions[i];
    final stepIndex = 1 + i;
    steps.add(
      Step(
        title: Text(option.name),
        content: _TicketOptionStep(
          option: option,
          isSelected: selectedOptions[option.id] ?? false,
          onChanged: (value) => onOptionChanged(option.id, value),
        ),
        isActive: currentStep == stepIndex,
      ),
    );
  }

  // 最後のStep: 決済確認
  steps.add(
    Step(
      title: Text(t.ticket.purchase.paymentTitle),
      content: _CheckoutConfirmStep(
        ticketTypeItem: ticketTypeItem,
        selectedOptions: selectedOptions,
      ),
      isActive: currentStep == steps.length,
    ),
  );

  return steps;
}

// ステップコントロール用のプライベートWidget
class _StepControls extends StatelessWidget {
  const _StepControls({
    required this.details,
    required this.currentStep,
    required this.totalSteps,
    required this.availableOptions,
    required this.selectedOptions,
    required this.isLoading,
    required this.onNext,
    required this.onCancel,
    required this.onCheckout,
  });

  final ControlsDetails details;
  final int currentStep;
  final int totalSteps;
  final List<TicketOption> availableOptions;
  final Map<String, bool> selectedOptions;
  final bool isLoading;
  final VoidCallback onNext;
  final VoidCallback onCancel;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          if (currentStep > 0)
            TextButton(
              onPressed: isLoading ? null : details.onStepCancel,
              child: Text(t.ticket.purchase.back),
            ),
          const Spacer(),
          if (currentStep < totalSteps - 1)
            FilledButton(
              onPressed: !isLoading ? onNext : null,
              child: Text(t.ticket.purchase.next),
            )
          else
            FilledButton(
              onPressed: !isLoading ? onCheckout : null,
              child: isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(t.ticket.purchase.startPayment),
            ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: isLoading ? null : onCancel,
            child: Text(t.ticket.purchase.cancel),
          ),
        ],
      ),
    );
  }
}

// 各チケットオプション用のStepWidget
class _TicketOptionStep extends StatelessWidget {
  const _TicketOptionStep({
    required this.option,
    required this.isSelected,
    required this.onChanged,
  });

  final TicketOption option;
  final bool isSelected;
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final textColor = colorScheme.onSurface;
    final isSelling = option.status.maybeMap(
      selling: (_) => true,
      notSelling: (_) => true,
      orElse: () => false,
    );

    final description = option.description;

    return Card.outlined(
      color: colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Text(
                option.name,
                style: textTheme.titleLarge?.copyWith(
                  color: textColor,
                ),
              ),
              if (description?.isNotEmpty ?? false) ...[
                Text(
                  description!,
                  style: textTheme.bodyMedium!.copyWith(
                    color: textColor,
                  ),
                ),
              ],
              if (isSelling)
                CheckboxListTile.adaptive(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  title: Text(
                    isSelling
                        ? t.ticket.purchase.addOption
                        : t.ticket.purchase.optionNotSelling,
                  ),
                  subtitle: isSelling
                      ? isSelected
                            ? Text(t.ticket.purchase.selected)
                            : Text(t.ticket.purchase.unselected)
                      : null,
                  value: isSelected,
                  enableFeedback: true,
                  enabled: isSelling,
                  onChanged: (value) => onChanged(value ?? false),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                )
              else
                Text(
                  t.ticket.purchase.optionSoldOut,
                  style: textTheme.bodyMedium?.copyWith(
                    color: textColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Step 1: チケット情報表示用Widget
class _TicketInfoStep extends StatelessWidget {
  const _TicketInfoStep({required this.ticketTypeItem});

  final TicketTypeWithOptionsItem ticketTypeItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final ticketType = ticketTypeItem.ticketType;
    final priceText =
        '¥${NumberFormat.decimalPattern().format(ticketType.price)}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        ticketType.name,
                        style: textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    RawChip(
                      label: Text(
                        ticketType.status.map(
                          selling: (status) => status.isFewRemaining
                              ? t.ticket.purchase.fewRemaining
                              : t.ticket.purchase.selling,
                          soldOut: (_) => t.ticket.purchase.soldOut,
                          notSelling: (_) => t.ticket.purchase.notSelling,
                        ),
                      ),
                      backgroundColor: ticketType.status.maybeMap(
                        selling: (status) => status.isFewRemaining
                            ? colorScheme.errorContainer
                            : colorScheme.primaryContainer,
                        soldOut: (_) => colorScheme.surfaceContainerHighest,
                        notSelling: (_) => colorScheme.surfaceContainerHighest,
                        orElse: () => colorScheme.surfaceContainerHighest,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
                if (ticketType.description?.isNotEmpty ?? false) ...[
                  TicketCardDescription(
                    description: ticketType.description!,
                    color: colorScheme.onSurface,
                  ),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t.ticket.purchase.price,
                      style: textTheme.labelLarge,
                    ),
                    Text(
                      priceText,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (ticketTypeItem.options.isNotEmpty) ...[
          Text(
            t.ticket.purchase.optionsAvailable,
            style: textTheme.bodyMedium,
          ),
          ...ticketTypeItem.options.map(
            (option) => Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  const Text('• '),
                  Expanded(child: Text(option.name)),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// 決済確認用Widget
class _CheckoutConfirmStep extends StatelessWidget {
  const _CheckoutConfirmStep({
    required this.ticketTypeItem,
    required this.selectedOptions,
  });

  final TicketTypeWithOptionsItem ticketTypeItem;
  final Map<String, bool> selectedOptions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final ticketType = ticketTypeItem.ticketType;
    final priceText =
        '¥${NumberFormat.decimalPattern().format(ticketType.price)}';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.ticket.purchase.ticket,
                  style: textTheme.labelLarge,
                ),
                Text(
                  ticketType.name,
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
            // 選択されたオプション（チェック済みのものだけ表示）
            ...() {
              final checkedOptions = selectedOptions.entries
                  .where((entry) => entry.value)
                  .toList();

              if (checkedOptions.isEmpty) {
                return <Widget>[];
              }

              return [
                const Divider(),
                Text(
                  t.ticket.purchase.additionalOptions,
                  style: textTheme.labelLarge,
                ),
                ...checkedOptions.map((entry) {
                  final option = ticketTypeItem.options.firstWhereOrNull(
                    (opt) => opt.id == entry.key,
                  );
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 16,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(option?.name ?? entry.key),
                        ),
                      ],
                    ),
                  );
                }),
              ];
            }(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.ticket.purchase.total,
                  style: textTheme.titleMedium,
                ),
                Text(
                  priceText,
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// auth_notifier.dartの_getRedirectToを参考にしたリダイレクトURL生成
String _getRedirectUrl(WidgetRef ref) {
  final environment = ref.read(environmentProvider);
  final ticketPath = const TicketRoute().location.replaceFirst('/', '');

  // Webプラットフォームの場合は `scheme://host:port` を使用
  if (kIsWeb) {
    return Uri.base.replace(path: ticketPath).toString();
  }
  return Uri(
    scheme: 'jp.flutterkaigi.conf2025${environment.appIdSuffix}',
    host: ticketPath,
  ).toString();
}
