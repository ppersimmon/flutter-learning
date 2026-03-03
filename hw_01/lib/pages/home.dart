import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';

import '../mock_data/mock_data.dart';
import '../utils/constants.dart';
import '../widgets/app_icon.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const HomePage({super.key, required this.navigationShell});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isBottomBarVisible = true;

  void _onItemTapped(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(user: user),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.reverse &&
              _isBottomBarVisible) {
            setState(() => _isBottomBarVisible = false);
          } else if (notification.direction == ScrollDirection.forward &&
              !_isBottomBarVisible) {
            setState(() => _isBottomBarVisible = true);
          }
          return true;
        },
        child: widget.navigationShell,
      ),

      floatingActionButton: AnimatedScale(
        scale: _isBottomBarVisible && widget.navigationShell.currentIndex == 0
            ? Sizes.p1
            : Sizes.p0,
        duration: const Duration(milliseconds: 200),

        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: CColors.grey50, size: Sizes.p26),
        ),
      ),

      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: _isBottomBarVisible ? kBottomNavigationBarHeight : Sizes.p0,

        child: Wrap(
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: widget.navigationShell.currentIndex,
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Theme.of(context).colorScheme.surface,
              items: const [
                BottomNavigationBarItem(
                  icon: AppIcon(icon: Icons.home_outlined),
                  activeIcon: AppIcon(icon: Icons.home_filled),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: AppIcon(icon: Icons.search),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: AppIcon(icon: Icons.notifications_outlined),
                  activeIcon: AppIcon(icon: Icons.notifications),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: AppIcon(icon: Icons.mail_outline),
                  activeIcon: AppIcon(icon: Icons.mail),
                  label: '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
