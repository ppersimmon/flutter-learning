import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_01/generated/locale_keys.g.dart';

import '../utils/constants.dart';
import 'app_icon.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      snap: true,

      leading: AppIcon(
        icon: Icons.account_circle_outlined,
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),

      title: AppIcon(icon: FontAwesomeIcons.xTwitter),
      centerTitle: true,
      actions: <Widget>[
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(LocaleKeys.appBar_upgrade.tr()),
        ),

        AppIcon(icon: Icons.more_vert_rounded),
        gapW8,
      ],

      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Theme.of(context).colorScheme.onSurface,
        indicatorColor: CColors.blue500,
        indicatorWeight: Sizes.p2,
        tabs: [
          Tab(text: LocaleKeys.appBar_for_you.tr()),
          Tab(text: LocaleKeys.appBar_following.tr()),
        ],
      ),
    );
  }
}
