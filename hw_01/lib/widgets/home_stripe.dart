import 'package:flutter/material.dart';
import 'package:hw_01/mock_data/get_mock_post.dart';

import '../helper/list_post.dart';
import 'home_app_bar.dart';

class HomeStripe extends StatelessWidget {
  const HomeStripe({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = MockPostStorage();
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [const HomeAppBar()];
        },
        body: TabBarView(
          children: [
            FutureBuilder(
              future: storage.fetch(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListPost(posts: snapshot.data!);
                }
                return CircularProgressIndicator();
              },
            ),

            FutureBuilder(
              future: storage.fetch(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListPost(posts: snapshot.data!);
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
