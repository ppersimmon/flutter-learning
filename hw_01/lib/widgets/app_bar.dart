import 'package:flutter/material.dart';
import 'account_header.dart';
import 'app_icon.dart';
import '../utils/constants.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: Sizes.p160,
      pinned: true,
      backgroundColor: CColors.blue500,

      leading: Center(child: AppIcon(icon: Icons.arrow_back_rounded, isFilled: true, onTap: () {Navigator.of(context).pop();})),

      actions: [
        AppIcon(icon: Icons.search_rounded, isFilled: true,),
        gapW8,
        AppIcon(icon: Icons.edit_outlined, isFilled: true),
        gapW8,
        AppIcon(icon: Icons.more_vert_rounded, isFilled: true),
        gapW8,
      ],

      flexibleSpace: FlexibleSpaceBar(
        background: AccountHeader(avatarRadius: Sizes.p40),
      ),
    );
  }
}