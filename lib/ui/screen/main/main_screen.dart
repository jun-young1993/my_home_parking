import 'package:flutter/material.dart';
import 'package:my_home_parking/routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱바 구현
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),

      // 메인 컨텐츠 영역
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 상단 카드 섹션
              Container(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(width: 16),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('안녕하세요!', style: TextStyle(fontSize: 18)),
                            Text('오늘도 좋은 하루 되세요'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 메뉴 그리드
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                children: [
                  _buildMenuCard(
                    '메뉴 1',
                    Icons.home,
                    onTap: () {
                      AppNavigator.push(Routes.parkingMap);
                    },
                  ),
                  _buildMenuCard('메뉴 2', Icons.favorite),
                  _buildMenuCard('메뉴 3', Icons.map),
                  _buildMenuCard('메뉴 4', Icons.shopping_cart),
                ],
              ),
            ],
          ),
        ),
      ),

      // 하단 네비게이션 바
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: '탐색'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
        ],
      ),
    );
  }

  Widget _buildMenuCard(String title, IconData icon, {Function()? onTap}) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
