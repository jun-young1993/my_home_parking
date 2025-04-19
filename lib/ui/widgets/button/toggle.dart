import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.activeIcon,
    this.inactiveIcon,
    this.size = 40,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Widget? activeIcon;
  final Widget? inactiveIcon;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeColor = this.activeColor ?? theme.colorScheme.primary;
    final inactiveColor =
        this.inactiveColor ?? theme.colorScheme.surfaceContainerHighest;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: size * 1.8,
        height: size,
        decoration: BoxDecoration(
          color: value ? activeColor.withOpacity(0.2) : inactiveColor,
          borderRadius: BorderRadius.circular(size / 2),
          border: Border.all(
            color: value ? activeColor : inactiveColor,
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: value ? size * 0.8 : 0,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: value ? activeColor : inactiveColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: value
                      ? activeIcon ??
                          Icon(
                            Icons.check_rounded,
                            color: theme.colorScheme.onPrimary,
                            size: size * 0.6,
                          )
                      : inactiveIcon ??
                          Icon(
                            Icons.close_rounded,
                            color: theme.colorScheme.onSurfaceVariant,
                            size: size * 0.6,
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
