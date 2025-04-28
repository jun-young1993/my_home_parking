import 'package:flutter/material.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';

class ParkingTimeModal extends StatelessWidget {
  final bool isParked;
  final Function(DateTime) onTimeSelected;
  final Function(bool) onCurrentSelected;

  const ParkingTimeModal({
    super.key,
    required this.isParked,
    required this.onTimeSelected,
    required this.onCurrentSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isParked ? Colors.red : Colors.green;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isParked ? Colors.red.shade50 : Colors.green.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                isParked ? Icons.logout : Icons.login,
                size: 40,
                color: isParked ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              isParked ? '출차 시간 선택' : '입차 시간 선택',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              isParked ? '출차 시간을 선택해주세요' : '입차 시간을 선택해주세요',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _TimeOptionButton(
                  icon: Icons.access_time,
                  label: '지금',
                  onTap: () {
                    onCurrentSelected(isParked);
                    Navigator.pop(context);
                  },
                  color: isParked ? Colors.red : Colors.green,
                ),
                _TimeOptionButton(
                  icon: Icons.calendar_today,
                  label: '시간 선택',
                  onTap: () {
                    // 현재 시간을 5분 단위로 올림

                    final now = DateTime.now();
                    BottomPicker.time(
                      pickerTitle: Text(
                        isParked ? '출차 예정 시간 선택' : '입차 예정 시간 선택',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: color,
                        ),
                      ),
                      buttonStyle: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      buttonContent: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 24,
                      ),
                      use24hFormat: true,
                      onSubmit: (dynamic time) {
                        final now = DateTime.now();
                        final selectedDateTime = DateTime(
                          now.year,
                          now.month,
                          now.day,
                          (time as DateTime).hour,
                          (time).minute,
                        );
                        // 한국 시간대(KST)로 변환
                        final kstDateTime = selectedDateTime.toUtc();
                        onTimeSelected(kstDateTime);
                        Navigator.pop(context);
                      },
                      onCloseButtonPressed: () {
                        Navigator.pop(context);
                      },
                      bottomPickerTheme: BottomPickerTheme.blue,
                      initialTime: Time(
                        hours: now.hour,
                        minutes: ((now.minute / 5).ceil() * 5) % 60,
                      ),
                      minTime: Time(
                        hours: now.hour,
                        minutes: ((now.minute / 5).ceil() * 5) % 60,
                      ),
                      maxTime: Time(
                        hours: 23,
                        minutes: 55,
                      ),
                      minuteInterval: 5,
                    ).show(context);
                  },
                  color: color,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const _TimeOptionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: color.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: color,
                size: 28,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
