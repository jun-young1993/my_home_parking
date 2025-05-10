import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/core/di/fcm_sender.dart';
import 'package:my_home_parking/model/car_number.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_event.dart';

class CarNumberSection extends StatefulWidget {
  const CarNumberSection({super.key, required this.onBack});

  final VoidCallback onBack;
  @override
  State<CarNumberSection> createState() => _CarNumberSectionState();
}

class _CarNumberSectionState extends State<CarNumberSection> {
  final _formKey = GlobalKey<FormState>();
  final _regionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _numberController = TextEditingController();

  @override
  void dispose() {
    _regionController.dispose();
    _categoryController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  bool _isValidRegion(String value) {
    if (value.isEmpty) return false;
    final number = int.tryParse(value);
    if (number == null) return false;
    return number >= 1 && number <= 999;
  }

  bool _isValidCategory(String value) {
    if (value.isEmpty) return false;
    final validCategories = [
      '가',
      '나',
      '다',
      '라',
      '마',
      '거',
      '너',
      '더',
      '러',
      '머',
      '버',
      '서',
      '어',
      '저',
      '고',
      '노',
      '도',
      '로',
      '모',
      '보',
      '소',
      '오',
      '조',
      '구',
      '누',
      '두',
      '루',
      '무',
      '부',
      '수',
      '우',
      '주',
      '아',
      '바',
      '사',
      '자',
      '허',
      '하',
      '호'
    ];
    return validCategories.contains(value);
  }

  bool _isValidNumber(String value) {
    if (value.isEmpty) return false;
    if (value.length < 4 || value.length > 4) return false;
    return int.tryParse(value) != null;
  }

  MainBloc get _mainBloc => context.read<MainBloc>();

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final fcmToken = await FCMSender.getToken(); 

      _mainBloc.add(
        MainEvent.createCarNumber(CarNumber(
            region: _regionController.text,
            category: _categoryController.text,
            number: _numberController.text,
            updatedAt: DateTime.now(),
            fcmToken: fcmToken,
            isParked: true,
            expectedTime: null,
            allowFcmNotification: true)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final horizontalPadding = isTablet ? 32.0 : 16.0;
    final maxWidth = isTablet ? 600.0 : double.infinity;

    return Scaffold(
      appBar: AppBar(
        title: const Text('차량 번호 등록'),
        leading: IconButton(
          onPressed: () => widget.onBack(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _regionController,
                            decoration: const InputDecoration(
                              labelText: '지역번호',
                              hintText: '예: 30',
                              errorMaxLines: 4,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '지역번호를 입력해주세요';
                              }
                              if (!_isValidRegion(value)) {
                                return '1~999 사이의 숫자를 입력해주세요';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: isTablet ? 16 : 8),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _categoryController,
                            decoration: const InputDecoration(
                              labelText: '분류',
                              hintText: '예: 조',
                              errorMaxLines: 4,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                            ),
                            textCapitalization: TextCapitalization.characters,
                            maxLength: 1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '분류를 입력해주세요';
                              }
                              if (!_isValidCategory(value)) {
                                return '올바른 한글 분류를 입력해주세요';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: isTablet ? 16 : 8),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _numberController,
                            decoration: const InputDecoration(
                              labelText: '번호',
                              hintText: '예: 7833',
                              errorMaxLines: 4,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '번호를 입력해주세요';
                              }
                              if (!_isValidNumber(value)) {
                                return '4자리 숫자를 입력해주세요';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: isTablet ? 56 : 48,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('등록하기'),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
