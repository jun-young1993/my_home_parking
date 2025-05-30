import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/constants/juny_constants.dart';
import 'package:flutter_common/state/app_config/app_config_bloc.dart';
import 'package:flutter_common/widgets/layout/setting_screen_layout.dart';
import 'package:my_home_parking/model/address_info.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:my_home_parking/routes.dart';
import 'package:my_home_parking/state/log/log_bloc.dart';
import 'package:my_home_parking/state/log/log_event.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_selector.dart';
import 'package:my_home_parking/state/notice/notice_bloc.dart';
import 'package:my_home_parking/state/notice/notice_event.dart';
import 'package:my_home_parking/ui/screen/main/sections/registration/user_info/post_adress_section.dart';
import 'package:my_home_parking/ui/widgets/empty_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum SettingMenu {
  addressChange,
  pushNotification,
  reset,
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    super.key,
  });
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  MainBloc get mainBloc => context.read<MainBloc>();
  LogBloc get logBloc => context.read<LogBloc>();
  NoticeBloc get noticeBloc => context.read<NoticeBloc>();
  AppConfigBloc get appConfigBloc => context.read<AppConfigBloc>();
  SettingMenu? selectedMenu;
  String _version = '';

  @override
  void initState() {
    super.initState();
    _getVersion();
  }

  Future<void> _getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
    });
  }

  Future<void> _showResetConfirmDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('초기화 확인'),
          content: const Text('모든 정보를 삭제합니다.\n정말 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                mainBloc.add(const MainEvent.removeUserInfo());
                Navigator.of(context).pop(() => AppNavigator.push(Routes.main));
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text('삭제'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return UserInfoSelector((userInfo) {
      if (userInfo == null) {
        return EmptyScreen(
          title: '차량 정보가 없습니다.',
          description: '차량 정보를 등록해주세요',
          context: context,
        );
      }
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: _buildSelectedMenu(context, userInfo, appConfigBloc),
      );
    });
  }

  Widget _buildSelectedMenu(
      BuildContext context, UserInfo userInfo, AppConfigBloc appConfigBloc) {
    if (selectedMenu == SettingMenu.addressChange) {
      return PostAddressSection(
        title: '주소 변경',
        description: '현재 주소: ${userInfo.address}',
        onSubmit: (AddressInfo data) {
          mainBloc.add(MainEvent.updateLocation(UserInfo(
            address: data.address,
            zoneCode: data.zoneCode,
          )));
          noticeBloc.add(const NoticeEvent.getNotices());
          logBloc.add(const LogEvent.getLogs());
          setState(() {
            selectedMenu = null;
          });
        },
        onCancel: () {
          setState(() {
            selectedMenu = null;
          });
        },
      );
    }

    return SettingScreenLayout(
        appConfigBloc: appConfigBloc,
        appKey: AppKeys.myHomeParking,
        topChildren: [
          // 주소 변경 버튼
          _buildAddressChangeButton(context, userInfo),
          // 푸시 알림 설정
          _buildPushNotificationSettingButton(context, userInfo),
        ],
        bottomChildren: [
          // 초기화 버튼(맨 하단)
          _buildResetButton(context),
        ]);
  }

  Widget _buildAddressChangeButton(BuildContext context, UserInfo userInfo) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final buttonHeight = isTablet ? 74.0 : 66.0;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 5, vertical: isTablet ? 8 : 6),
        child: SizedBox(
          width: double.infinity,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectedMenu = SettingMenu.addressChange;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                  horizontal: 16, vertical: isTablet ? 8 : 6),
              alignment: Alignment.centerLeft,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.edit_location_alt, size: isTablet ? 24 : 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '주소 변경',
                        style: TextStyle(
                          fontSize: isTablet ? 16 : 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        userInfo.address ?? '주소 정보 없음',
                        style: TextStyle(
                          fontSize: isTablet ? 16 : 14,
                          color: Colors.white70,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  Icons.chevron_right,
                  size: isTablet ? 24 : 20,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPushNotificationSettingButton(
      BuildContext context, UserInfo userInfo) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    try {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: isTablet ? 16 : 8,
          ),
          title: Text(
            '푸시 알림',
            style: TextStyle(
              fontSize: isTablet ? 18 : 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            userInfo.carNumber!.allowFcmNotification
                ? '푸시 알림이 활성화되어 있습니다'
                : '푸시 알림이 비활성화되어 있습니다',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: isTablet ? 14 : 12,
            ),
          ),
          trailing: Transform.scale(
            scale: isTablet ? 1.2 : 1.0,
            child: Switch(
              value: userInfo.carNumber!.allowFcmNotification,
              onChanged: (bool value) {
                setState(() {
                  selectedMenu = SettingMenu.pushNotification;
                });
                mainBloc.add(MainEvent.updateParkingCarNumber(
                  userInfo.carNumber!.copyWith(
                    allowFcmNotification: value,
                  ),
                ));
              },
              activeColor: Colors.green,
              inactiveTrackColor: Colors.red.shade200,
              inactiveThumbColor: Colors.red,
            ),
          ),
        ),
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }

  Widget _buildResetButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: isTablet ? 16 : 8,
        ),
        title: Row(
          children: [
            Text(
              '설정 초기화',
              style: TextStyle(
                fontSize: isTablet ? 18 : 16,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.warning,
              size: isTablet ? 22 : 18,
              color: Colors.red,
            ),
          ],
        ),
        trailing: TextButton(
          onPressed: () {
            setState(() {
              selectedMenu = SettingMenu.reset;
            });
            _showResetConfirmDialog(context);
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 24 : 16,
              vertical: isTablet ? 12 : 8,
            ),
          ),
          child: Text(
            '초기화',
            style: TextStyle(
              fontSize: isTablet ? 16 : 14,
            ),
          ),
        ),
      ),
    );
  }
}
