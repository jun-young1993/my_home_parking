import 'package:flutter/material.dart';
import 'package:my_home_parking/model/api/response/parking_location/parking_location_zone.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:my_home_parking/ui/screen/parking_status/sections/my_car_section.dart';
import 'package:my_home_parking/ui/screen/parking_status/widgets/parking_car_item.dart';

class ParkingStatusListSection extends StatelessWidget {
  const ParkingStatusListSection({
    super.key,
    required this.parkingLocationZone,
    required this.userInfo,
    required this.isParked,
    required this.onParkingChanged,
  });

  final ParkingLocationZoneResponse parkingLocationZone;
  final UserInfo userInfo;
  final bool isParked;
  final ValueChanged<bool> onParkingChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyCarSection(
          userInfo: userInfo,
          isParked: isParked,
          onParkingChanged: onParkingChanged,
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: parkingLocationZone.carNumbers.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return ParkingCarItem(
                carNumber: parkingLocationZone.carNumbers[index].toString(),
                entryTime: '2024-03-15 16:30',
                isResident: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
