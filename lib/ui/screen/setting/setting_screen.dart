import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:my_home_parking/routes.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_selector.dart';
import 'package:my_home_parking/ui/widgets/empty_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  MainBloc get mainBloc => context.read<MainBloc>();

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
            // title: const Text('설정'),
            ),
        body: Column(
          children: [
            // 주소 변경 버튼
            _buildAddressChangeButton(context),
            // 푸시 알림 설정
            _buildPushNotificationSettingButton(context, userInfo),
            // 중간 공간을 차지하는 Expanded
            const Expanded(child: SizedBox()),
            // 초기화 버튼(맨 하단)
            _buildResetButton(context),
          ],
        ),
      );
    });
  }

  Widget _buildAddressChangeButton(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              mainBloc.add(const MainEvent.checkUserInfo());
            },
            icon: const Icon(Icons.edit_location_alt),
            label: const Text('주소 변경'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPushNotificationSettingButton(
      BuildContext context, UserInfo userInfo) {
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
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        title: const Text(
          '푸시 알림',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          userInfo.carNumber!.allowFcmNotification
              ? '푸시 알림이 활성화되어 있습니다'
              : '푸시 알림이 비활성화되어 있습니다',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        trailing: Switch(
          value: userInfo.carNumber!.allowFcmNotification,
          onChanged: (bool value) {
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
    );
  }

  Widget _buildResetButton(BuildContext context) {
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
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        title: const Row(
          children: [
            Text(
              '설정 초기화',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.warning,
              size: 18,
              color: Colors.red,
            ),
          ],
        ),
        trailing: TextButton(
          onPressed: () => _showResetConfirmDialog(context),
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          child: const Text('초기화'),
        ),
      ),
    );
  }
}
