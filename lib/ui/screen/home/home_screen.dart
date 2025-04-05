import 'package:flutter/material.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/ui/screen/main/main_screen.dart';
import 'package:my_home_parking/ui/screen/parking_map/parking_map_screen.dart';
import 'package:my_home_parking/ui/screen/parking_status/parking_status_screen.dart';
import 'package:my_home_parking/ui/screen/setting/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MainScreen(),
    const ParkingMapScreen(),
    const ParkingStatusScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppConstants.parkingMainMenuHome,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: AppConstants.parkingMainMenuParkingMap,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.local_parking),
            label: AppConstants.parkingMainMenuParkingStatus,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: AppConstants.parkingMainMenuSetting,
          ),
        ],
      ),
    );
  }
}
