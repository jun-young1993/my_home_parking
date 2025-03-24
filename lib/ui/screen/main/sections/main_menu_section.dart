import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:my_home_parking/routes.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_selector.dart';
import 'package:my_home_parking/ui/widgets/button/parking_change_button.dart';

class MainMenuSection extends StatefulWidget {
  const MainMenuSection({
    super.key,
  });

  @override
  State<MainMenuSection> createState() => _MainMenuSectionState();
}

class _MainMenuSectionState extends State<MainMenuSection> {
  MainBloc get mainBloc => context.read<MainBloc>();
  @override
  Widget build(BuildContext context) {
    return UserInfoSelector((userInfo) {
      if (userInfo == null) return const SizedBox.shrink();
      print('rerender ${userInfo.carNumber?.isParked}');
      return SingleChildScrollView(
        child: Column(
          children: [
            // 사용자 정보 카드
            _buildUserCard(context, userInfo),
            _buildParkingNoticeSection(context),
            // 추가 정보 또는 콘텐츠 (중간 공간)
            _buildContentSection(context),
          ],
        ),
      );
    });
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
                  child: const Icon(
                    Icons.directions_car,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: userInfo.isCarNumberValid
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  userInfo.carNumber.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: userInfo.carNumber?.isParked ?? false
                                        ? Colors.green
                                        : Colors.red,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: (userInfo.carNumber?.isParked ??
                                                    false
                                                ? Colors.green
                                                : Colors.red)
                                            .withOpacity(0.5),
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            ParkingChangeButton(
                              isParked: userInfo.carNumber?.isParked ?? false,
                              onParkingChanged: (isParked) {
                                mainBloc.add(MainEvent.updateCarNumber(
                                  userInfo.carNumber!
                                      .copyWith(isParked: isParked),
                                ));
                              },
                            ),
                          ],
                        )
                      : TextButton(
                          onPressed: () {
                            mainBloc.add(const MainEvent.checkCarNumber());
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

  Widget _buildContentSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '최근 알림',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('아직 알림이 없습니다.'),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '주변 정보',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('주변 정보를 불러오는 중입니다...'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParkingNoticeSection(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          AppNavigator.push(Routes.parkingNotice);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제목 영역
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '주차장 게시판',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    size: 20,
                  ),
                ],
              ),

              // 구분선
              const SizedBox(height: 12),
              Divider(
                color: Colors.grey.shade200,
              ),
              const SizedBox(height: 12),

              // 최신 게시글 제목
              Text(
                '[공지] 주차장 이용 안내', // 실제 데이터로 교체 필요
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
