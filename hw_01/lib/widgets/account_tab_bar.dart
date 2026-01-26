import 'package:flutter/material.dart';

class AccountTabBar extends StatelessWidget {
  const AccountTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.1)),
      ),
      child: const TabBar(
        isScrollable: true,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.lightBlue,
        indicatorWeight: 3.0,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        tabAlignment: TabAlignment.start,

        tabs: [
          Tab(text: 'Posts'),
          Tab(text: 'Replies'),
          Tab(text: 'Highlights'),
          Tab(text: 'Articles'),
          Tab(text: 'Media'),
          Tab(text: 'Likes'),
        ],
      ),
    );
  }
}