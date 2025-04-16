import 'package:flutter/material.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/state/log/log_selector.dart';
import 'package:my_home_parking/ui/widgets/empty_screen.dart';
import 'package:my_home_parking/ui/widgets/log/log_item_widget.dart';

class ParkingLogScreen extends StatefulWidget {
  const ParkingLogScreen({super.key});

  @override
  State<ParkingLogScreen> createState() => _ParkingLogScreenState();
}

class _ParkingLogScreenState extends State<ParkingLogScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.parkingLogMenuDisplayName),
      ),
      body: LogListSelector(
        (logs) {
          if (logs.isEmpty) {
            return _buildEmptyLog(context,
                title: '주차 로그가 없습니다', description: '주차 기록이 생성되면 여기에 표시됩니다');
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: logs.length,
            itemBuilder: (context, index) {
              final log = logs[index];
              return LogItemWidget(
                log: log,
                onTap: () {
                  // TODO: 로그 상세 보기 기능 구현
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyLog(
    BuildContext context, {
    required String title,
    required String description,
  }) {
    return EmptyScreen(
      title: title,
      description: description,
      context: context,
    );
  }
}
