import 'package:flutter/material.dart';
import 'package:my_home_parking/model/log/log.dart';
import 'package:timeago/timeago.dart' as timeago;

class LogItemWidget extends StatelessWidget {
  final Log log;
  final VoidCallback? onTap;

  const LogItemWidget({
    super.key,
    required this.log,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: _buildColoredDescription(
                  log.description,
                  Theme.of(context).textTheme.bodyLarge!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                timeago.format(log.createdAt, locale: 'ko'),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan _buildColoredDescription(String description, TextStyle baseStyle) {
    final List<InlineSpan> spans = [];
    int start = 0;
    final RegExp regExp = RegExp(r'(출차|주차)');
    final matches = regExp.allMatches(description);

    for (final match in matches) {
      if (match.start > start) {
        spans.add(TextSpan(
            text: description.substring(start, match.start), style: baseStyle));
      }
      final String matchedText = match.group(0)!;
      Color color;
      if (matchedText == '출차') {
        color = Colors.red;
      } else {
        color = Colors.green;
      }
      spans.add(TextSpan(
          text: matchedText,
          style:
              baseStyle.copyWith(color: color, fontWeight: FontWeight.bold)));
      start = match.end;
    }
    if (start < description.length) {
      spans.add(TextSpan(text: description.substring(start), style: baseStyle));
    }
    return TextSpan(children: spans);
  }
}
