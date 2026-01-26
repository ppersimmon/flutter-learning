import 'package:flutter/material.dart';
import 'account_header.dart';
import 'circle_icon.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150.0,
      pinned: true,
      backgroundColor: const Color(0xFF38b6ff),

      leading: Center(child: CircleIcon(icon: Icons.arrow_back_rounded)),

      actions: [
        CircleIcon(icon: Icons.search_rounded),
        const SizedBox(width: 8),
        CircleIcon(icon: Icons.edit_outlined),
        const SizedBox(width: 8),
        CircleIcon(icon: Icons.more_vert_rounded),
        const SizedBox(width: 8),
      ],

      flexibleSpace: FlexibleSpaceBar(
        background: AccountHeader(avatarRadius: 40),
      ),
    );
  }
}