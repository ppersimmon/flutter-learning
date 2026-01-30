import 'package:flutter/material.dart';
import '../pages/account.dart';
import '../utils/constants.dart';
import 'app_icon.dart';
import 'user_avatar.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CColors.grey50,
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: CColors.grey50),
            accountName: Text("admin", style: TextStyle(color: CColors.black, fontWeight: FontWeight.bold)),
            accountEmail: Text("@admin", style: TextStyle(color: CColors.black, fontWeight: FontWeight.bold)),
            currentAccountPicture: UserAvatar()
          ),

          ListTile(
            leading: const AppIcon(icon: Icons.person_outline),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountPage()));
            },
          ),
        ],
      ),
    );
  }
}