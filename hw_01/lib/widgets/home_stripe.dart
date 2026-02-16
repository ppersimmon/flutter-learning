import 'package:flutter/material.dart';
import 'package:hw_01/mock_data/post.dart';

import '../helper/list_post.dart';
import 'home_app_bar.dart';

class HomeStripe extends StatelessWidget {
  final List<Post> posts;
  const HomeStripe({super.key, required this.posts});

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
            ListPost(posts: posts),
            ListPost(posts: posts),
          ],
        ),
      ),
    );
  }
}
