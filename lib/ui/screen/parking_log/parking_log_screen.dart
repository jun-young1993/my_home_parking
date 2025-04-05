import 'package:flutter/material.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/state/log/log_selector.dart';
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
          ),
        ],
      ),
    );
  }
}
