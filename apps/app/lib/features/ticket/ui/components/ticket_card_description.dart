import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketCardDescription extends StatelessWidget {
  const TicketCardDescription({
    required this.description,
    required this.color,
    super.key,
  });

  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MarkdownBody(
      data: description,
      styleSheet: MarkdownStyleSheet.fromTheme(
        theme.copyWith(
          textTheme: theme.textTheme.apply(
            bodyColor: color,
            displayColor: color,
            decorationColor: color,
          ),
        ),
      ).copyWith(),
      onTapLink: (text, href, title) async {
        if (href != null) {
          final uri = Uri.parse(href);
          if (await canLaunchUrl(uri)) {
            await launchUrl(
              uri,
              mode: LaunchMode.externalApplication,
            );
          }
        }
      },
    );
  }
}
