import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_selector.dart';
import 'package:my_home_parking/ui/screen/parking_status/sections/parking_status_list_section.dart';
import 'package:my_home_parking/ui/screen/parking_status/sections/parking_status_summary_section.dart';
import 'package:my_home_parking/ui/widgets/empty_screen.dart';

class ParkingStatusScreen extends StatefulWidget {
  const ParkingStatusScreen({super.key});

  @override
  State<ParkingStatusScreen> createState() => _ParkingStatusScreenState();
}

class _ParkingStatusScreenState extends State<ParkingStatusScreen> {
  MainBloc get mainBloc => context.read<MainBloc>();

  @override
  void initState() {
    super.initState();
    mainBloc.add(const MainEvent.getParkingLocationZone());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(AppConstants.parkingMainMenuParkingStatus),
          ),
      body: UserInfoSelector((userInfo) {
        return ParkingLocationZoneSelector((parkingLocationZone) {
          if (parkingLocationZone == null) {
            return EmptyScreen(
              title: '등록된 데이터가 없습니다',
              description: '등록된 데이터를 추가해주세요',
              context: context,
            );
          }

          return Column(
            children: [
              // 상단 요약 정보 섹션
              ParkingStatusSummarySection(
                totalParkingSpaces: parkingLocationZone.carNumbers.length,
                availableParkingSpaces: parkingLocationZone.carNumbers
                    .where((car) => !car.isParked)
                    .length,
                parkedCars: parkingLocationZone.carNumbers
                    .where((car) => car.isParked)
                    .length,
                exitCars: parkingLocationZone.carNumbers
                    .where((car) => !car.isParked)
                    .length,
              ),
              // 주차 차량 목록 섹션
              Expanded(
                child: ParkingStatusListSection(
                  onSendFcm: (senderCarNumberId, targetCarNumberId, message) {
                    mainBloc.add(MainEvent.sendFcm(
                      senderCarNumberId,
                      targetCarNumberId,
                      message,
                    ));
                  },
                  parkingLocationZone: parkingLocationZone,
                  userInfo: userInfo!,
                  isParked: userInfo.carNumber!.isParked,
                  onParkingChanged: (isParked) {
                    mainBloc.add(MainEvent.updateParkingCarNumber(
                      userInfo.carNumber!
                          .copyWith(isParked: isParked, expectedTime: null),
                    ));
                  },
                  onMessageChanged: (String message) {
                    mainBloc.add(MainEvent.updateMessageCarNumber(
                      userInfo.carNumber!.copyWith(message: message),
                    ));
                  },
                  onTimeSelected: (DateTime dateTime) {
                    mainBloc.add(MainEvent.updateParkingCarNumber(
                      userInfo.carNumber!.copyWith(expectedTime: dateTime),
                    ));
                  },
                ),
              ),
            ],
          );
        });
      }),
    );
  }
}
