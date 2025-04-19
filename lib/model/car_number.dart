import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_number.freezed.dart';
part 'car_number.g.dart';

@freezed
class CarNumber with _$CarNumber {
  const factory CarNumber({
    String? id,
    required String region, // 지역 (예: "30")
    required String category, // 분류 (예: "조")
    required String number, // 번호 (예: "7833")
    @Default(true) bool isParked,
    String? message,
    required String fcmToken,
    required DateTime? updatedAt,
    @Default(true) bool allowFcmNotification,
  }) = _CarNumber;

  const CarNumber._(); // private constructor

  // id를 제외한 요청용 JSON 생성
  Map<String, dynamic> toRequestJson() => {
        'region': region,
        'category': category,
        'number': number,
        'isParked': isParked,
        'message': message,
        'fcmToken': fcmToken,
        'allowFcmNotification': allowFcmNotification,
        // id와 parkingLocationId는 제외
      };

  factory CarNumber.fromJson(Map<String, dynamic> json) =>
      _$CarNumberFromJson(json);

  bool get isValid =>
      region.isNotEmpty && category.isNotEmpty && number.isNotEmpty;

  @override
  String toString() => '$region $category $number';
}
