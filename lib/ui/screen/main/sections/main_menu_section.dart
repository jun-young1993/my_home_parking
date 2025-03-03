import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_state.dart';

class MainMenuSection extends StatelessWidget {
  const MainMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        final userInfo = state.userInfo;
        if (userInfo == null) return const SizedBox.shrink();

        return Scaffold(
          appBar: AppBar(
            title: const Text('마이 홈 파킹'),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // TODO: 사용자 정보 수정 화면으로 이동
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // 사용자 정보 카드
                Card(
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '차량 번호: ${userInfo.carNumber}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '집 주소: ${userInfo.address}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),

                // 메뉴 그리드
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(16),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildMenuCard(
                      context,
                      '주차장 찾기',
                      Icons.map,
                      onTap: () {
                        // TODO: 주차장 찾기 화면으로 이동
                      },
                    ),
                    _buildMenuCard(
                      context,
                      '즐겨찾기',
                      Icons.favorite,
                      onTap: () {
                        // TODO: 즐겨찾기 화면으로 이동
                      },
                    ),
                    _buildMenuCard(
                      context,
                      '주차 내역',
                      Icons.history,
                      onTap: () {
                        // TODO: 주차 내역 화면으로 이동
                      },
                    ),
                    _buildMenuCard(
                      context,
                      '설정',
                      Icons.settings,
                      onTap: () {
                        // TODO: 설정 화면으로 이동
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
