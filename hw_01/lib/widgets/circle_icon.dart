import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;

  const CircleIcon({
    super.key,
    required this.icon,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.6),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}