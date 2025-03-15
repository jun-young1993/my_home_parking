import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_number.freezed.dart';
part 'car_number.g.dart';

@freezed
class CarNumber with _$CarNumber {
  const CarNumber._();
  const factory CarNumber({
    required String region, // 지역 (예: "30")
    required String category, // 분류 (예: "조")
    required String number, // 번호 (예: "7833")
  }) = _CarNumber;

  factory CarNumber.fromJson(Map<String, dynamic> json) =>
      _$CarNumberFromJson(json);

  bool get isValid =>
      region.isNotEmpty && category.isNotEmpty && number.isNotEmpty;
}
