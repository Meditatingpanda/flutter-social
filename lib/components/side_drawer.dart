import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/home_provider.dart';
import 'package:shoppingapp/screens/followers_screen.dart';
import 'package:shoppingapp/screens/following_screen.dart';
import 'package:shoppingapp/screens/login_screen.dart';
import 'package:shoppingapp/screens/profile_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProvider homeNotifier =
        Provider.of<HomeProvider>(context, listen: true);
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              accountName: Text(
                "Gyana Ranjan Panda",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              accountEmail: Text(
                "grp.gyanaranjan@gmail.com",
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  "G",
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ), //Text
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(' My Profile '),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profile()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user_sharp),
            title: const Text(' Followers '),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Followers()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.workspace_premium),
            title: const Text(' Followings '),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Following()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              homeNotifier.logout(context);
              //Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
