import 'package:flutter/material.dart';
import 'package:my_home_parking/core/enums/object_type.dart';

class ObjectSelectionButton extends StatelessWidget {
  final Object3DType objectType;
  final VoidCallback onSelected;

  const ObjectSelectionButton({
    super.key,
    required this.objectType,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSelected,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(_getDisplayName()),
    );
  }

  String _getDisplayName() {
    switch (objectType) {
      case Object3DType.pillar:
        return '기둥';
      case Object3DType.house:
        return '집';
      case Object3DType.car:
        return '차량';
      case Object3DType.parkingSpace:
        return '주차공간';
    }
  }
}
