import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final Color? background;
  final double? size;
  final bool isFilled;
  final VoidCallback? onTap;

  const AppIcon({
    super.key,
    required this.icon,
    this.color,
    this.background,
    this.size,
    this.isFilled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final setIconColor = color ?? (isFilled ? CColors.grey50 : CColors.black);
    final setIconBackground = background ??
        (isFilled ? CColors.outline : CColors.transparent);

    return Container(
      padding: const EdgeInsets.all(Sizes.p8),
      decoration: BoxDecoration(
        color: setIconBackground,
        shape: BoxShape.circle,
      ),
      child: Material(
        color: CColors.transparent,
        child: InkWell(
          onTap: onTap,
            child: Icon(
              icon,
              color: setIconColor,
              size: size ?? Sizes.p24,
            ),
        ),
          ),
    );
  }
}