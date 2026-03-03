import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../mock_data/post.dart';
import '../pages/account.dart';
import '../pages/home.dart';
import '../pages/single_post.dart';
import '../widgets/home_stripe.dart';

enum AppPages {
  home('/'),
  search('/search'),
  notifications('/notifications'),
  mail('/mail'),
  account('/account'),
  singlePost('/single-post');

  const AppPages(this.path);
  final String path;
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeTabKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _searchTabKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _notificationsTabKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _mailTabKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppPages.home.path,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomePage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeTabKey,
          routes: [
            GoRoute(
              path: AppPages.home.path,
              name: AppPages.home.name,
              builder: (context, state) => const HomeStripe(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _searchTabKey,
          routes: [
            GoRoute(
              path: AppPages.search.path,
              name: AppPages.search.name,
              builder: (context, state) =>
                  const Scaffold(body: Center(child: Text('Search'))),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _notificationsTabKey,
          routes: [
            GoRoute(
              path: AppPages.notifications.path,
              name: AppPages.notifications.name,
              builder: (context, state) =>
                  const Scaffold(body: Center(child: Text('Notifications'))),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _mailTabKey,
          routes: [
            GoRoute(
              path: AppPages.mail.path,
              name: AppPages.mail.name,
              builder: (context, state) =>
                  const Scaffold(body: Center(child: Text('Mail'))),
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: AppPages.account.path,
      name: AppPages.account.name,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        return AccountPage();
      },
    ),

    GoRoute(
      path: AppPages.singlePost.path,
      name: AppPages.singlePost.name,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final post = state.extra as Post;
        return SinglePostPage(post: post);
      },
    ),
  ],
);
