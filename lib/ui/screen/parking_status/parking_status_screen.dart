import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_selector.dart';
import 'package:my_home_parking/ui/screen/parking_status/sections/parking_status_list_section.dart';
import 'package:my_home_parking/ui/screen/parking_status/sections/parking_status_summary_section.dart';

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
        title: const Text('주차 현황'),
      ),
      body: UserInfoSelector((userInfo) {
        return ParkingLocationZoneSelector((parkingLocationZone) {
          if (parkingLocationZone == null) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 48,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '등록된 데이터가 없습니다',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              // 상단 요약 정보 섹션
              const ParkingStatusSummarySection(),
              // 주차 차량 목록 섹션x
              Expanded(
                child: ParkingStatusListSection(
                  parkingLocationZone: parkingLocationZone,
                  userInfo: userInfo!,
                  isParked: userInfo.carNumber!.isParked,
                  onParkingChanged: (isParked) {
                    mainBloc.add(MainEvent.updateCarNumber(
                      userInfo.carNumber!.copyWith(isParked: isParked),
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
