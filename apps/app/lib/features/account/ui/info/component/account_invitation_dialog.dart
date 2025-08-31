import 'package:app/core/gen/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final class AccountInvitationDialog extends HookWidget {
  const AccountInvitationDialog({
    required VoidCallback onCancel,
    required VoidCallback onFailure,
    required VoidCallback onSuccess,
    super.key,
  }) : _onCancel = onCancel,
       _onFailure = onFailure,
       _onSuccess = onSuccess;

  final VoidCallback _onCancel;
  final VoidCallback _onFailure;
  final VoidCallback _onSuccess;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final isLoading = useState(false);

    return Stack(
      children: [
        AlertDialog(
          title: Text(L10n.of(context).accountInvitationDialogTitle),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: L10n.of(context).accountInvitationCode,
                hintText: L10n.of(context).accountInvitationCodeHint,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.card_giftcard),
              ),
              textCapitalization: TextCapitalization.characters,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return L10n.of(context).accountInvitationCodeValidation;
                }
                return null;
              },
              enabled: !isLoading.value,
            ),
          ),
          actions: [
            TextButton(
              onPressed: isLoading.value ? null : _onCancel,
              child: Text(L10n.of(context).accountCancel),
            ),
            FilledButton(
              onPressed: isLoading.value
                  ? null
                  : () async {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      try {
                        isLoading.value = true;

                        // TODO: 実際のAPI呼び出しを実装する際に修正すること
                        await Future<void>.delayed(const Duration(seconds: 1));

                        if (context.mounted) {
                          _onSuccess();
                        }
                      } on Exception catch (_) {
                        if (context.mounted) {
                          _onFailure();
                        }
                      } finally {
                        isLoading.value = false;
                      }
                    },
              child: Text(L10n.of(context).accountApply),
            ),
          ],
        ),
        if (isLoading.value)
          ColoredBox(
            color: Colors.black.withValues(alpha: 0.3),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
