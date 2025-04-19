import 'package:flutter/material.dart';

class ParkingStatusSummarySection extends StatelessWidget {
  final int totalParkingSpaces;
  final int availableParkingSpaces;
  final int parkedCars;
  final int exitCars;

  const ParkingStatusSummarySection({
    super.key,
    required this.totalParkingSpaces,
    required this.availableParkingSpaces,
    required this.parkedCars,
    required this.exitCars,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatusItem(
            context,
            '전체 주차면',
            totalParkingSpaces.toString(),
            Theme.of(context).colorScheme.primary,
          ),
          _buildStatusItem(
            context,
            '입차',
            parkedCars.toString(),
            Colors.green,
          ),
          _buildStatusItem(
            context,
            '출차',
            exitCars.toString(),
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem(
    BuildContext context,
    String label,
    String value,
    Color valueColor,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: valueColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
