import 'package:flutter/material.dart';
import 'package:my_home_parking/ui/widgets/modal/parking_time_modal.dart';

class ParkingChangeButton extends StatelessWidget {
  final bool isParked;
  final ValueChanged<bool> onParkingChanged;
  final double horizontalPadding;
  final double verticalPadding;
  final double iconSize;
  final double spacing;
  final FontWeight fontWeight;

  const ParkingChangeButton({
    super.key,
    required this.isParked,
    required this.onParkingChanged,
    this.horizontalPadding = 16,
    this.verticalPadding = 12,
    this.iconSize = 18,
    this.spacing = 4,
    this.fontWeight = FontWeight.w600,
  });

  void _showTimeModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ParkingTimeModal(
        isParked: isParked,
        onCurrentSelected: (isCurrent) {
          onParkingChanged(!isCurrent);
        },
        onTimeSelected: (dateTime) {
          print('dateTime: $dateTime');
          // onParkingChanged(dateTime);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      // onPressed: () => onParkingChanged(!isParked),
      onPressed: () => _showTimeModal(context),
      style: FilledButton.styleFrom(
        backgroundColor: isParked ? Colors.red.shade50 : Colors.green.shade50,
        foregroundColor: isParked ? Colors.red : Colors.green,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isParked ? Icons.logout : Icons.login,
            size: iconSize,
          ),
          SizedBox(width: spacing),
          Text(
            isParked ? '출차' : '입차',
            style: TextStyle(
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
