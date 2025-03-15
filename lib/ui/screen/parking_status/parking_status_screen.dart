import 'package:flutter/material.dart';
import 'package:my_home_parking/ui/screen/parking_status/sections/parking_status_list_section.dart';
import 'package:my_home_parking/ui/screen/parking_status/sections/parking_status_summary_section.dart';

class ParkingStatusScreen extends StatelessWidget {
  const ParkingStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주차 현황'),
      ),
      body: const Column(
        children: [
          // 상단 요약 정보 섹션
          ParkingStatusSummarySection(),
          // 주차 차량 목록 섹션
          Expanded(
            child: ParkingStatusListSection(),
          ),
        ],
      ),
    );
  }
}
