import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mock_data/mock_data.dart';
import '../models/post_model.dart';
import '../utils/constants.dart';
import '../widgets/account_tab_bar.dart';
import '../widgets/app_bar.dart';
import '../widgets/post_item.dart';
import '../widgets/profile_info.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final displayPosts = Provider.of<PostModel>(context).posts;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const AccountAppBar(),

            SliverToBoxAdapter(child: ProfileInfo(user: user)),

            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: Sizes.p20),
                child: AccountTabBar(),
              ),
            ),

            if (displayPosts.isEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: Sizes.p40),
                  child: Center(child: CircularProgressIndicator()),
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final post = displayPosts[index];

                  return PostItem(post: post);
                }, childCount: displayPosts.length),
              ),
            const SliverToBoxAdapter(child: gapH40),
          ],
        ),
      ),
    );
  }
}
