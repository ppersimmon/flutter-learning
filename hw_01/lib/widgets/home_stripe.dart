import 'package:flutter/material.dart';
import 'package:hw_01/models/post_model.dart';
import 'package:hw_01/utils/constants.dart';
import 'package:provider/provider.dart';

import '../helper/list_post.dart';
import '../widgets/app_icon.dart';
import 'home_app_bar.dart';

class HomeStripe extends StatelessWidget {
  const HomeStripe({super.key});

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<PostModel>(context);

    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [const HomeAppBar()];
        },
        body: TabBarView(
          children: [
            _buildTabContent(context, postModel),
            _buildTabContent(context, postModel),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(BuildContext context, PostModel postModel) {
    if (postModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (postModel.errorMsg != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcon(icon: Icons.error_outline, color: CColors.red),
            gapH12,
            Text(
              postModel.errorMsg!,
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            gapH12,
            ElevatedButton(
              onPressed: () => postModel.fetchPosts(),
              child: const Text('Try Again'),
            ),
          ],
        ),
      );
    }

    return ListPost(posts: postModel.posts);
  }
}
