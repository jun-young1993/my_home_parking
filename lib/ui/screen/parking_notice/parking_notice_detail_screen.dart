import 'package:flutter/material.dart';
import 'package:my_home_parking/routes.dart';

class ParkingNoticeDetailScreen extends StatefulWidget {
  const ParkingNoticeDetailScreen({super.key});

  @override
  State<ParkingNoticeDetailScreen> createState() =>
      _ParkingNoticeDetailScreenState();
}

class _ParkingNoticeDetailScreenState extends State<ParkingNoticeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주차장 게시판'),
        leading: IconButton(
          onPressed: () {
            AppNavigator.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
