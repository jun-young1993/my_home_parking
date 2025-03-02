import 'dart:convert';

import 'package:my_home_parking/core/enums/object_type.dart';

// 주차장 지도 화면의 상태를 관리하는 클래스
class ParkingMapState {
  // 당겨서 새로고침 기능의 활성화 상태
  final bool isPullToRefreshEnabled;
  // 현재 선택된 3D 객체 타입
  final Object3DType selectedObjectType;

  // private 생성자: 초기값 설정
  // named constructor with default values
  ParkingMapState._({
    // 기본적으로 새로고침 기능 활성화
    this.isPullToRefreshEnabled = true,
    // 기본 선택 객체는 기둥으로 설정
    this.selectedObjectType = Object3DType.pillar,
  });

  // 초기 상태를 생성하는 factory 생성자
  // private 생성자를 호출하여 기본값으로 상태 초기화
  // 이 구문은 ParkingMapState 클래스의 factory 생성자입니다.
  // initialize()는 named constructor로, 새로운 ParkingMapState 인스턴스를 생성합니다.
  // this._()는 private 생성자인 ParkingMapState._()를 호출하여
  // isPullToRefreshEnabled와 selectedObjectType의 기본값으로 초기화합니다.
  // : this._() 구문은 생성자 초기화 리스트(initializer list)로,
  // 다른 생성자를 호출하여 객체를 초기화하는 문법입니다.
  ParkingMapState.initialize() : this._();

  // 불변 객체의 상태를 복사하면서 일부 값만 변경하는 메서드
  // 상태 업데이트 시 사용됨 (불변성 유지)
  ParkingMapState copyWith({
    bool? isPullToRefreshEnabled,
    Object3DType? selectedObjectType,
  }) {
    return ParkingMapState._(
      // 새 값이 제공되면 그 값을 사용하고, 아니면 현재 값을 유지
      isPullToRefreshEnabled:
          isPullToRefreshEnabled ?? this.isPullToRefreshEnabled,
      selectedObjectType: selectedObjectType ?? this.selectedObjectType,
    );
  }

  // WebView와 통신하기 위한 메시지 생성 메서드
  // 현재 선택된 객체 정보를 JSON 형식으로 변환
  String createObjectSelectionMessage(Object3DType objectType) {
    return jsonEncode({
      'type': 'objectSelection', // 메시지 타입
      'data': {'objectType': objectType.value}, // 선택된 객체 정보
    });
  }
}
