import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // After logging out, navigate the user to the login screen or another appropriate screen
    Navigator.of(context)
        .pushReplacementNamed('/login'); // Adjust the route name as needed
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          //home list tile
          const MyDrawerTile(
            text: 'H O M E',
            icon: Icons.home,
          ),
          const SizedBox(
            height: 20,
          ),
          //settings list tile
          const MyDrawerTile(
            text: 'S E T T I N G S',
            icon: Icons.settings,
          ),
          const Spacer(),
          //logout list tile
          MyDrawerTile(
            text: 'L O G O U T',
            icon: Icons.logout,
            onTap: () => _logout(context),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
