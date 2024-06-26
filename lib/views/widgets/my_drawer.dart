import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:messagesapp/providers/auth/auth_provider.dart';
import 'package:provider/provider.dart';

import 'my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void SignOut(BuildContext context) async {
    //get auth service

    final authservice = Provider.of<AuthService>(context, listen: false);
    try {
      // Attempt to sign in the user with Firebase Auth
      await authservice.signOut();
    } on FirebaseAuthException catch (e) {
      // If there's an error, display a message to the user
      print(e
          .message); // Consider using something like Fluttertoast for user feedback
      Fluttertoast.showToast(msg: e.message ?? "An error occurred");
    }
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
            child: Image.asset(
              'assets/images/logo.png',
              height: 100,
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
            onTap: () => SignOut(context),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
