import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/ad_manager/ad_widgets.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:my_home_parking/routes.dart';
import 'package:my_home_parking/state/log/log_bloc.dart';
import 'package:my_home_parking/state/log/log_event.dart';
import 'package:my_home_parking/state/log/log_selector.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_selector.dart';
import 'package:my_home_parking/state/notice/notice_bloc.dart';
import 'package:my_home_parking/state/notice/notice_event.dart';
import 'package:my_home_parking/state/notice/notice_selector.dart';
import 'package:my_home_parking/ui/widgets/button/parking_change_button.dart';
import 'package:my_home_parking/ui/widgets/log/log_item_widget.dart';
import 'package:my_home_parking/ui/widgets/time_remaining/time_remaining_widget.dart';

class MainMenuSection extends StatefulWidget {
  const MainMenuSection({
    super.key,
  });

  @override
  State<MainMenuSection> createState() => _MainMenuSectionState();
}

class _MainMenuSectionState extends State<MainMenuSection> {
  MainBloc get mainBloc => context.read<MainBloc>();
  NoticeBloc get noticeBloc => context.read<NoticeBloc>();
  LogBloc get logBloc => context.read<LogBloc>();

  @override
  void initState() {
    super.initState();
    noticeBloc.add(const NoticeEvent.getNotices());
    logBloc.add(const LogEvent.getLogs());
  }

  @override
  Widget build(BuildContext context) {
    return UserInfoSelector((userInfo) {
      if (userInfo == null) return const SizedBox.shrink();
      return SingleChildScrollView(
        child: Column(
          children: [
            _buildUserCard(context, userInfo),
            _buildLogSection(context),
            _buildParkingNoticeSection(context),
            // _buildBannerAdWidget(context),
          ],
        ),
      );
    });
  }

  Widget _buildBannerAdWidget(BuildContext context) {
    return const BannerAdWidget();
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
                                mainBloc.add(MainEvent.updateParkingCarNumber(
                                  userInfo.carNumber!.copyWith(
                                      isParked: isParked, expectedTime: null),
                                ));
                              },
                              onTimeSelected: (DateTime dateTime) {
                                mainBloc.add(MainEvent.updateParkingCarNumber(
                                  userInfo.carNumber!
                                      .copyWith(expectedTime: dateTime),
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
            const SizedBox(height: 8),
            userInfo.carNumber?.expectedTime == null
                ? const SizedBox.shrink()
                : TimeRemainingWidget(
                    onFinished: () {
                      print('onFinished');
                      mainBloc.add(const MainEvent.checkUserInfo());
                    },
                    description:
                        userInfo.carNumber!.isParked ? '출차 까지' : '입차 까지',
                    expectedTime: userInfo.carNumber!.expectedTime!,
                  ),
            const SizedBox(height: 8),
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

  Widget _buildLogSection(BuildContext context) {
    return _buildCardContainer(
        context: context,
        title: AppConstants.parkingLogMenuDisplayName,
        onTap: () {
          AppNavigator.push(Routes.parkingLog);
        },
        children: [
          LogFirstSelector((log) {
            if (log == null) {
              return Text(AppConstants.parkingEmptySpaceMenuDisplayName);
            }
            return LogItemWidget(log: log);
          })
        ]);
  }

  Widget _buildParkingNoticeSection(BuildContext context) {
    return _buildCardContainer(
        context: context,
        title: AppConstants.parkingNoticeMenuDisplayName,
        onTap: () {
          AppNavigator.push(Routes.parkingNotice);
        },
        children: [
          NoticeFirstSelector((notice) {
            if (notice == null) {
              return Text(AppConstants.parkingEmptySpaceMenuDisplayName);
            }
            return Text(
              notice.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            );
          })
        ]);
  }

  Widget _buildCardContainer({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
    required List<Widget> children,
  }) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
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
                    title,
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
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
