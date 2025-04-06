import 'package:flutter/material.dart';
import 'package:my_home_parking/model/api/response/parking_location/parking_location_zone.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:my_home_parking/ui/screen/parking_status/sections/my_car_section.dart';
import 'package:my_home_parking/ui/screen/parking_status/widgets/parking_car_item.dart';
import 'package:intl/intl.dart';

class ParkingStatusListSection extends StatelessWidget {
  ParkingStatusListSection({
    super.key,
    required this.parkingLocationZone,
    required this.userInfo,
    required this.isParked,
    required this.onParkingChanged,
    required this.onMessageChanged,
  });

  final ParkingLocationZoneResponse parkingLocationZone;
  final UserInfo userInfo;
  final bool isParked;
  final ValueChanged<bool> onParkingChanged;
  final ValueChanged<String> onMessageChanged;
  final dateFormatter = DateFormat('yyyy-MM-dd HH:mm');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyCarSection(
          userInfo: userInfo,
          isParked: isParked,
          parkingMessage: userInfo.carNumber?.message,
          onParkingChanged: onParkingChanged,
          onMessageChanged: onMessageChanged,
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: parkingLocationZone.carNumbers.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return ParkingCarItem(
                carNumber: parkingLocationZone.carNumbers[index].toString(),
                entryTime:
                    parkingLocationZone.carNumbers[index].updatedAt != null
                        ? dateFormatter.format(
                            parkingLocationZone.carNumbers[index].updatedAt!)
                        : '-',
                isParked: parkingLocationZone.carNumbers[index].isParked,
                parkingMessage: parkingLocationZone.carNumbers[index].message,
              );
            },
          ),
        ),
      ],
    );
  }
}
