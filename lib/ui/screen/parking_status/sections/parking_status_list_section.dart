import 'package:flutter/material.dart';
import 'package:my_home_parking/ui/screen/parking_status/widgets/parking_car_item.dart';

class ParkingStatusListSection extends StatelessWidget {
  const ParkingStatusListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 10, // TODO: 실제 데이터로 변경
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return const ParkingCarItem(
          carNumber: '30조 7833',
          entryTime: '2024-03-15 16:30',
          isResident: true,
        );
      },
    );
  }
}
