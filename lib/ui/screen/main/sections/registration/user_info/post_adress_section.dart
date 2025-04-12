import 'package:daum_postcode_view/daum_postcode_view.dart';
import 'package:flutter/material.dart';
import 'package:my_home_parking/model/address_info.dart';

class PostAddressSection extends StatefulWidget {
  const PostAddressSection({super.key, required this.onSubmit});

  final Function(AddressInfo) onSubmit;

  @override
  State<PostAddressSection> createState() => _PostAddressSectionState();
}

class _PostAddressSectionState extends State<PostAddressSection> {
  final _homeAddressController = TextEditingController();
  String? _address;
  String? _zonecode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_off,
                        size: 64,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '현재 디바이스에 주소정보가 없습니다',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.grey[700],
                                ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '주소정보를 등록해주세요',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      const SizedBox(height: 24),
                      _homeAddressController.text.isEmpty
                          ? SizedBox(
                              height: 400,
                              child: DaumPostcodeView(
                                onComplete: (DaumPostcodeModel model) {
                                  setState(() {
                                    _address =
                                        '${model.address} ${model.buildingName}';
                                    _zonecode = model.buildingCode;
                                    _homeAddressController.text =
                                        '$_address, ${model.zonecode}';
                                  });
                                },
                                options: const DaumPostcodeOptions(
                                  animation: true,
                                  hideMapBtn: true,
                                ),
                              ),
                            )
                          : Column(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: TextFormField(
                                  controller: _homeAddressController,
                                  readOnly: true,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    labelText: '상세 주소',
                                    alignLabelWithHint: true,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _homeAddressController.clear();
                                        _address = null;
                                        _zonecode = null;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[300],
                                    ),
                                    child: const Text('주소 다시 선택'),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_address != null &&
                                          _zonecode != null) {
                                        widget.onSubmit(AddressInfo(
                                          address: _address!,
                                          zoneCode: _zonecode!,
                                        ));
                                      }
                                    },
                                    child: const Text('주소 등록하기'),
                                  ),
                                ],
                              ),
                            ])
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
