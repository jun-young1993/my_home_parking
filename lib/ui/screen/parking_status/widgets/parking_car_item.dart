import 'package:flutter/material.dart';
import 'package:my_home_parking/ui/screen/parking_status/widgets/parking_message.dart';

class ParkingCarItem extends StatelessWidget {
  final String carNumber;
  final String entryTime;
  final bool isParked;
  final String? parkingMessage;

  const ParkingCarItem({
    super.key,
    required this.carNumber,
    required this.entryTime,
    required this.isParked,
    this.parkingMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                // 차량 번호와 입차 시간
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        carNumber,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        entryTime,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                    ],
                  ),
                ),
                // 거주자 여부 표시
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isParked ? '주차중' : '출차중',
                    style: TextStyle(
                      color: isParked ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            ParkingMessage(
              parkingMessage: parkingMessage,
              onMessageChanged: (message) {},
            ),
          ],
        ),
      ),
    );
  }
}
