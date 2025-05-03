import 'dart:async';
import 'package:flutter/material.dart';

class TimeRemainingWidget extends StatefulWidget {
  final DateTime expectedTime;
  final String? description;
  final void Function() onFinished;

  const TimeRemainingWidget(
      {super.key,
      required this.expectedTime,
      this.description,
      required this.onFinished});

  @override
  State<TimeRemainingWidget> createState() => _TimeRemainingWidgetState();
}

class _TimeRemainingWidgetState extends State<TimeRemainingWidget> {
  late Timer _timer;
  late Duration _remainingTime;
  bool _hasFinished = false;

  @override
  void initState() {
    super.initState();
    _updateRemainingTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateRemainingTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateRemainingTime() {
    final now = DateTime.now();
    _remainingTime = widget.expectedTime.difference(now);
    if (_remainingTime.isNegative && !_hasFinished) {
      _hasFinished = true;
      widget.onFinished();
    }
    if (mounted) {
      setState(() {});
    }
  }

  String _formatRemainingTime() {
    if (_remainingTime.isNegative) {
      return '시간이 지났습니다';
    }

    final hours = _remainingTime.inHours;
    final minutes = _remainingTime.inMinutes.remainder(60) + 1;

    if (hours > 0) {
      return '${widget.description ?? ''} $hours시간 $minutes분';
    } else {
      return '${widget.description ?? ''} $minutes분';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isExpired = _remainingTime.isNegative;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isExpired
            ? Colors.red.shade50
            : theme.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isExpired ? Icons.timer_off : Icons.timer,
            size: 16,
            color: isExpired ? Colors.red : theme.colorScheme.primary,
          ),
          const SizedBox(width: 4),
          Text(
            _formatRemainingTime(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isExpired ? Colors.red : theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
