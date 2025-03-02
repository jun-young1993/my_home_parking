import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_home_parking/core/enums/object_type.dart';

abstract class ParkingMapEvent {}

class TogglePullToRefresh extends ParkingMapEvent {}

class SelectObject extends ParkingMapEvent {
  final Object3DType objectType;
  SelectObject(this.objectType);
}

class AddObject extends ParkingMapEvent {
  final InAppWebViewController webViewController;
  final Object3DType objectType;
  AddObject(this.webViewController, this.objectType);
}
