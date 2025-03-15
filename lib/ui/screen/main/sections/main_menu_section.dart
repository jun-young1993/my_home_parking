import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:my_home_parking/routes.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_state.dart';

class MainMenuSection extends StatelessWidget {
  final void Function() navigateToCarNumberInput;

  const MainMenuSection({super.key, required this.navigateToCarNumberInput});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        final userInfo = state.userInfo;
        if (userInfo == null) return const SizedBox.shrink();

        return Scaffold(
          appBar: AppBar(
            title: Text(AppConstants.appName),
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
                _buildUserCard(context, userInfo),

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
                        AppNavigator.push(Routes.parkingMap);
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

  Widget _buildUserCard(
    BuildContext context,
    UserInfo userInfo,
  ) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.directions_car),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: userInfo.isCarNumberValid
                      ? Text(
                          '${userInfo.carNumber!.region} ${userInfo.carNumber!.category} ${userInfo.carNumber!.number}',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      : TextButton(
                          onPressed: () {
                            navigateToCarNumberInput();
                          },
                          child: Text(
                            '차량번호 입력하기',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.home),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    userInfo.address,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
