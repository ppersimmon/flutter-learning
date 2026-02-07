import 'package:flutter/material.dart';
import 'package:hw_01/mock_data/get_mock_post.dart';

import '../mock_data/post.dart';
import '../utils/constants.dart';
import '../widgets/account_tab_bar.dart';
import '../widgets/app_bar.dart';
import '../widgets/post_item.dart';
import '../widgets/profile_info.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = MockPostStorage();
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: CColors.grey50,
        body: CustomScrollView(
          slivers: [
            const AccountAppBar(),

            SliverToBoxAdapter(child: ProfileInfo()),

            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: Sizes.p20),
                child: AccountTabBar(),
              ),
            ),

            FutureBuilder<List<Post>>(
              future: storage.fetch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: Sizes.p40),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text("Error")),
                  );
                }

                final posts = snapshot.data ?? [];

                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return PostItem(post: posts[index]);
                  }, childCount: posts.length),
                );
              },
            ),
            const SliverToBoxAdapter(child: gapH40),
          ],
        ),
      ),
    );
  }
}
