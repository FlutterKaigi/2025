import 'dart:convert';

import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    required this.error,
    this.onRetry,
    this.isRetrying,
    super.key,
  });

  final Object error;
  final VoidCallback? onRetry;
  final bool? isRetrying;

  String _getErrorMessage() {
    if (error is DioException) {
      final dioError = error as DioException;
      final response = dioError.response;

      if (response?.data != null) {
        final data = response!.data;

        // dataがMapで、messageキーが含まれている場合
        if (data is Map && data.containsKey('message')) {
          return data['message'].toString();
        }

        // それ以外の場合はJSONとして表示を試みる
        try {
          if (data is Map || data is List) {
            return const JsonEncoder.withIndent('  ').convert(data);
          }
          return data.toString();
        } on Exception catch (_) {
          return data.toString();
        }
      }
    }

    return error.toString();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Card(
        color: theme.colorScheme.errorContainer,
        child: DefaultTextStyle(
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.onErrorContainer,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: theme.colorScheme.onErrorContainer,
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        t.common.error.general.occurred,
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  _getErrorMessage(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
                if (onRetry != null)
                  FilledButton.tonalIcon(
                    onPressed: (isRetrying ?? false) ? null : onRetry,
                    label: Text(t.common.error.server.retry),
                    icon: const Icon(Icons.refresh),
                  ),
                if (isRetrying ?? false)
                  const CircularProgressIndicator.adaptive(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
