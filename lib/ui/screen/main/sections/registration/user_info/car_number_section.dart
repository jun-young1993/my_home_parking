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

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final fcmToken = await FCMSender.getToken();

      context.read<MainBloc>().add(
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('차량 번호 등록'),
        leading: IconButton(
          onPressed: () => widget.onBack(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _regionController,
                      decoration: const InputDecoration(
                        labelText: '지역번호',
                        hintText: '예: 30',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '지역번호를 입력해주세요';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _categoryController,
                      decoration: const InputDecoration(
                        labelText: '분류',
                        hintText: '예: 가',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '분류를 입력해주세요';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _numberController,
                      decoration: const InputDecoration(
                        labelText: '번호',
                        hintText: '예: 1234',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '번호를 입력해주세요';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('등록하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
