import 'package:flutter/material.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';

class ErrorView extends StatelessWidget {
  final AppException error;
  final VoidCallback? onRetry;

  const ErrorView({
    super.key,
    required this.error,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(),
            const SizedBox(height: 16),
            Text(
              _getErrorMessage(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('다시 시도'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    IconData iconData;
    Color iconColor;

    if (error is NotFoundUserInfoException) {
      iconData = Icons.person_off;
      iconColor = Colors.orange;
    } else if (error is InvalidUserInfoException) {
      iconData = Icons.error_outline;
      iconColor = Colors.red;
    } else if (error is UserInfoSaveException) {
      iconData = Icons.cloud_off;
      iconColor = Colors.grey;
    } else {
      iconData = Icons.error;
      iconColor = Colors.red;
    }

    return Icon(
      iconData,
      size: 64,
      color: iconColor,
    );
  }

  String _getErrorMessage() {
    return (error).message;
    return error.toString();
  }
}
