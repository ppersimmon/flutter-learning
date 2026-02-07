import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../generated/locale_keys.g.dart';
import '../utils/constants.dart';

class AccountTabBar extends StatelessWidget {
  const AccountTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: CColors.grey100, width: 0.1)),
      ),
      child: TabBar(
        isScrollable: true,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.lightBlue,
        indicatorWeight: 3.0,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        tabAlignment: TabAlignment.start,

        tabs: [
          Tab(text: LocaleKeys.tabs_posts.tr()),
          Tab(text: LocaleKeys.tabs_replies.tr()),
          Tab(text: LocaleKeys.tabs_highlights.tr()),
          Tab(text: LocaleKeys.tabs_articles.tr()),
          Tab(text: LocaleKeys.tabs_media.tr()),
          Tab(text: LocaleKeys.tabs_likes.tr()),
        ],
      ),
    );
  }
}
