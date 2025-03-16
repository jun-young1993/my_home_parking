import 'package:flutter/material.dart';
import 'package:my_home_parking/model/user_info.dart';

class MyCarSection extends StatelessWidget {
  final UserInfo userInfo;
  final bool isParked;
  final ValueChanged<bool> onParkingChanged;

  const MyCarSection({
    super.key,
    required this.userInfo,
    required this.isParked,
    required this.onParkingChanged,
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
        child: Row(
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
                  if (isParked) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '주차중',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            FilledButton(
              onPressed: () => onParkingChanged(!isParked),
              style: FilledButton.styleFrom(
                backgroundColor:
                    isParked ? Colors.red.shade50 : Colors.green.shade50,
                foregroundColor: isParked ? Colors.red : Colors.green,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isParked ? Icons.logout : Icons.login,
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    isParked ? '출차' : '입차',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
