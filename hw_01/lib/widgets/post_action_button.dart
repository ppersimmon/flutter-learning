import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/constants.dart';

class PostActionButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String label;
  final Function()? onTap;

  const PostActionButton({
    super.key,
    required this.icon,
    this.color,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          FaIcon(icon, size: Sizes.p16, color: color ?? CColors.grey100),
          if (label.isNotEmpty) ...[
            gapW4,
            Text(
              label,
              style: TextStyle(fontSize: 12, color: color ?? CColors.grey100),
            ),
          ],
        ],
      ),
    );
  }
}
