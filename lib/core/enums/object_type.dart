enum Object3DType {
  pillar('pillar', '기둥'),
  house('house', '집'),
  car('car', '차량'),
  parkingSpace('parking_space', '주차공간');

  final String value;
  final String displayName;

  const Object3DType(this.value, this.displayName);
}

extension Object3DTypeExtension on Object3DType {
  String get toJson => value;

  static Object3DType fromJson(String value) {
    return Object3DType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError('Invalid Object3DType value: $value'),
    );
  }
}
