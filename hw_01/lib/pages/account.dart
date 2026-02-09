import 'package:flutter/material.dart';

import '../mock_data/mock_data.dart';
import '../mock_data/post.dart';
import '../utils/constants.dart';
import '../widgets/account_tab_bar.dart';
import '../widgets/app_bar.dart';
import '../widgets/post_item.dart';
import '../widgets/profile_info.dart';

class AccountPage extends StatefulWidget {
  final List<Post> posts;
  final Function(String) setLikeSwitcher;
  const AccountPage({
    super.key,
    required this.posts,
    required this.setLikeSwitcher,
  });

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final displayPosts = widget.posts;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: CColors.grey50,
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

                  return PostItem(
                    post: post,
                    setLike: () {
                      widget.setLikeSwitcher(post.id);
                      setState(() {});
                    },
                  );
                }, childCount: displayPosts.length),
              ),
            const SliverToBoxAdapter(child: gapH40),
          ],
        ),
      ),
    );
  }
}
