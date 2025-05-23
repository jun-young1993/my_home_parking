import 'package:flutter/material.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:my_home_parking/ui/screen/parking_status/widgets/parking_message.dart';
import 'package:my_home_parking/ui/widgets/button/parking_change_button.dart';

class MyCarSection extends StatelessWidget {
  final UserInfo userInfo;
  final bool isParked;
  final ValueChanged<bool> onParkingChanged;
  final ValueChanged<DateTime> onTimeSelected;
  final String? parkingMessage;
  final void Function(String) onMessageChanged;

  const MyCarSection({
    super.key,
    required this.userInfo,
    required this.isParked,
    required this.onParkingChanged,
    required this.onTimeSelected,
    this.parkingMessage,
    required this.onMessageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '나의 차량',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        userInfo.carNumber?.toString() ?? '등록된 차량이 없습니다',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: isParked ? Colors.green : Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            isParked ? '주차중' : '출차중',
                            style: TextStyle(
                              color: isParked ? Colors.green : Colors.red,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ParkingChangeButton(
                  isParked: isParked,
                  onParkingChanged: onParkingChanged,
                  onTimeSelected: onTimeSelected,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ParkingMessage(
              parkingMessage: parkingMessage,
              emptyText: '주차 메세지를 메모해보세요',
              onMessageChanged: onMessageChanged,
              isEditable: true,
            ),
          ],
        ),
      ),
    );
  }
}
