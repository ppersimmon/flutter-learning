import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../utils/constants.dart';
import '../widgets/home_stripe.dart';
import '../widgets/app_icon.dart';
import '../widgets/drawer.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isBottomBarVisible = true;

  static const List<Widget> _pages = [
    HomeStripe(),
    Scaffold(backgroundColor: CColors.grey50, body: Center(child: Text('Search'))),
    Scaffold(backgroundColor: CColors.grey50, body: Center(child: Text('Notifications'))),
    Scaffold(backgroundColor: CColors.grey50, body: Center(child: Text('Messages'))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isBottomBarVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
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
        child: IndexedStack(index: _selectedIndex, children: _pages),
      ),

      floatingActionButton: AnimatedScale(
        scale: _isBottomBarVisible && _selectedIndex == 0 ? Sizes.p1 : Sizes.p0,
        duration: const Duration(milliseconds: 200),

        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: CColors.blue500,
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
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: CColors.grey50,
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
