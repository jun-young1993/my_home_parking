import 'package:flutter/material.dart';

class ParkingMessage extends StatelessWidget {
  final String? parkingMessage;
  final String? emptyText;
  final void Function(String)? onMessageChanged;
  final bool isEditable;
  const ParkingMessage({
    super.key,
    this.parkingMessage,
    this.emptyText = '',
    this.onMessageChanged,
    this.isEditable = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isEditable) {
          _showMessageDialog(context);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                parkingMessage ?? (emptyText!),
                style: TextStyle(
                  color: parkingMessage == null
                      ? Colors.grey.shade600
                      : Colors.black87,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 8),
            if (isEditable)
              Icon(
                Icons.edit,
                size: 16,
                color: Colors.grey.shade600,
              ),
          ],
        ),
      ),
    );
  }

  void _showMessageDialog(BuildContext context) {
    final controller = TextEditingController(text: parkingMessage);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('주차 메시지'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: '예: 주말에만 운행합니다.',
          ),
          maxLines: 2,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              onMessageChanged?.call(controller.text);
              Navigator.pop(context);
            },
            child: const Text('저장'),
          ),
        ],
      ),
    );
  }
}
