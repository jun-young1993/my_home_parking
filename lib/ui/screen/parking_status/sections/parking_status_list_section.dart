import 'package:flutter/material.dart';
import 'package:my_home_parking/model/api/response/parking_location/parking_location_zone.dart';
import 'package:my_home_parking/model/car_number.dart';
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
    required this.onSendFcm,
  });

  final ParkingLocationZoneResponse parkingLocationZone;
  final UserInfo userInfo;
  final bool isParked;
  final ValueChanged<bool> onParkingChanged;
  final ValueChanged<String> onMessageChanged;
  final void Function(
          String senderCarNumberId, String targetCarNumberId, String message)
      onSendFcm;
  final dateFormatter = DateFormat('yyyy-MM-dd HH:mm');
  final List<Map<String, dynamic>> _predefinedMessages = [
    {
      'message': '이중주차 했어요',
      'icon': Icons.car_crash_rounded,
      'color': Colors.orange,
    },
    {
      'message': '잠시만 주차할게요',
      'icon': Icons.timer_outlined,
      'color': Colors.blue,
    },
    {
      'message': '차량 이동 부탁드립니다',
      'icon': Icons.directions_car_outlined,
      'color': Colors.red,
    },
  ];

  List<CarNumber> _getOtherCars() {
    return parkingLocationZone.carNumbers
        .where((car) => car.toString() != userInfo.carNumber?.toString())
        .toList();
  }

  void _showMessageDialog(BuildContext context, CarNumber targetCar) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.message_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '메시지 보내기',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          targetCar.toString(),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ..._predefinedMessages.map((message) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () {
                      if (userInfo.carNumber?.id != null &&
                          targetCar.id != null) {
                        onSendFcm(
                          userInfo.carNumber!.id!,
                          targetCar.id!,
                          message['message'],
                        );
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('"${message['message']}" 메시지가 전송되었습니다'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: message['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: message['color'].withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            message['icon'],
                            color: message['color'],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              message['message'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.close_rounded,
                        size: 20,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '취소',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final otherCars = _getOtherCars();

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
            itemCount: otherCars.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final car = otherCars[index];
              return InkWell(
                onTap: () => _showMessageDialog(context, car),
                child: ParkingCarItem(
                  carNumber: car.toString(),
                  entryTime: car.updatedAt != null
                      ? dateFormatter.format(car.updatedAt!)
                      : '-',
                  isParked: car.isParked,
                  parkingMessage: car.message,
                  allowFcmNotification: car.allowFcmNotification,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
