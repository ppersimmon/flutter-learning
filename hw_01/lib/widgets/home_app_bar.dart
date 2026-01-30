import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: CColors.grey50,
      ),

      backgroundColor: CColors.grey50,

      leading: AppIcon(icon: Icons.account_circle_outlined, onTap: () {Scaffold.of(context).openDrawer();}),

      title: AppIcon(icon: FontAwesomeIcons.xTwitter),
      centerTitle: true,
      actions: <Widget>[
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: CColors.black,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text('Upgrade'),
        ),

        AppIcon(icon: Icons.more_vert_rounded),
        gapW8,
      ],

      bottom: const TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: CColors.black,
        indicatorColor: CColors.blue500,
        indicatorWeight: Sizes.p2,
        tabs: [
          Tab(text: 'For you'),
          Tab(text: 'Following'),
        ],
      ),
    );
  }
}
