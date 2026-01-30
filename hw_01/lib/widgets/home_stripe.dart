import 'package:flutter/material.dart';
import '../widgets/post_item.dart';
import 'home_app_bar.dart';

class HomeStripe extends StatelessWidget {
  const HomeStripe({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [const HomeAppBar()];
        },
        body: TabBarView(
          children: [
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return PostItem();
              },
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const PostItem();
              },
            ),
          ],
        ),
      ),
    );
  }
}
