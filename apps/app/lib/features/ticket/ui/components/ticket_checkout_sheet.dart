import 'package:app/core/provider/environment.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/ticket/data/notifier/ticket_notifier.dart';
import 'package:app/features/ticket/data/provider/ticket_types_provider.dart';
import 'package:bff_client/bff_client.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    final availableOptions = ticketTypeItem.options
        .where(
          (option) => option.status.maybeMap(
            selling: (_) => true,
            orElse: () => false,
          ),
        )
        .toList();

    // 総ステップ数を計算（チケット情報確認 + 各オプション + 決済確認）
    final totalSteps = 2 + availableOptions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('チケット購入'),
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
            availableOptions: availableOptions,
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
                  ticketNotifierProvider.notifier,
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
                  throw Exception('決済ページを開けませんでした');
                }
              } on Exception catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('エラーが発生しました: $e'),
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
          availableOptions: availableOptions,
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
      title: const Text('チケット情報を確認'),
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
      title: const Text('決済を開始'),
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
              child: const Text('戻る'),
            ),
          const Spacer(),
          if (currentStep < totalSteps - 1)
            FilledButton(
              onPressed: !isLoading ? onNext : null,
              child: const Text('次へ'),
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
                  : const Text('決済を開始'),
            ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: isLoading ? null : onCancel,
            child: const Text('キャンセル'),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  option.name,
                  style: textTheme.titleLarge,
                ),
                if (option.description?.isNotEmpty ?? false) ...[
                  Text(
                    option.description!,
                    style: textTheme.bodyMedium,
                  ),
                ],
                CheckboxListTile(
                  title: Text(
                    'このオプションを追加する',
                    style: textTheme.bodyLarge,
                  ),
                  subtitle: isSelected ? const Text('選択済み') : const Text('未選択'),
                  value: isSelected,
                  onChanged: (value) => onChanged(value ?? false),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 16,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'このオプションが必要な場合はチェックしてください。',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
        '¥${ticketType.price.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]},',
        )}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
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
                        style: textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: ticketType.status.maybeMap(
                          selling: (status) => status.isFewRemaining
                              ? colorScheme.errorContainer
                              : colorScheme.primaryContainer,
                          soldOut: (_) => colorScheme.surfaceContainerHighest,
                          notSelling: (_) =>
                              colorScheme.surfaceContainerHighest,
                          orElse: () => colorScheme.surfaceContainerHighest,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ticketType.status.map(
                          selling: (status) =>
                              status.isFewRemaining ? '残りわずか' : '販売中',
                          soldOut: (_) => '売り切れ',
                          notSelling: (_) => '販売終了',
                        ),
                        style: textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
                if (ticketType.description?.isNotEmpty ?? false) ...[
                  Text(
                    ticketType.description!,
                    style: textTheme.bodyMedium,
                  ),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '価格',
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
            'このチケットには以下のオプションがあります：',
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
    final colorScheme = theme.colorScheme;

    final ticketType = ticketTypeItem.ticketType;
    final priceText =
        '¥${ticketType.price.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]},',
        )}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          '購入内容を確認してください：',
          style: textTheme.titleMedium,
        ),
        Card(
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
                      'チケット',
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
                      '追加オプション',
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
                      '合計',
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
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 20,
                    color: colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '決済について',
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
              Text(
                '「決済を開始」ボタンを押すと、Stripeの決済ページに遷移します。',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ),
      ],
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
