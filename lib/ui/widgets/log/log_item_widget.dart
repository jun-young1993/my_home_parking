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
              Text(
                log.description,
                style: Theme.of(context).textTheme.bodyLarge,
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
}
