import 'package:flutter/material.dart';
import 'package:hw_01/widgets/post_item.dart';
import '../widgets/app_bar.dart';
import '../widgets/account_tab_bar.dart';
import '../widgets/profile_info.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            const AccountAppBar(),

            SliverToBoxAdapter(
              child: ProfileInfo(),
            ),

            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: AccountTabBar(),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return const PostItem();
              }, childCount: 3),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}