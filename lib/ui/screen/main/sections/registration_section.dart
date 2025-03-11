import 'package:daum_postcode_view/daum_postcode_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_event.dart';

class RegistrationSection extends StatefulWidget {
  const RegistrationSection({super.key});

  @override
  State<RegistrationSection> createState() => _RegistrationSectionState();
}

class _RegistrationSectionState extends State<RegistrationSection> {
  final _formKey = GlobalKey<FormState>();
  final _homeAddressController = TextEditingController();
  final _zoneCodeController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _homeAddressController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final userInfo = UserInfo(
        address: _homeAddressController.text,
        zoneCode: _zoneCodeController.text,
        phoneNumber: _phoneNumberController.text,
      );

      context.read<MainBloc>().add(MainEvent.saveUserInfo(userInfo));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('사용자 정보 등록')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: DaumPostcodeView(
                  onComplete: (DaumPostcodeModel model) {
                    print(
                        "model: ${model.address}, ${model.buildingName}, ${model.zonecode}");
                    setState(() {
                      _homeAddressController.text =
                          '${model.address} ${model.buildingName}';
                    });
                  },
                  options: const DaumPostcodeOptions(
                    animation: true,
                    hideMapBtn: true,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _homeAddressController,
                decoration: const InputDecoration(
                  labelText: '상세 주소',
                  hintText: '상세 주소를 입력해주세요',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '주소를 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: _submitForm, child: const Text('등록하기')),
            ],
          ),
        ),
      ),
    );
  }
}
