import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messagesapp/services/auth/login_or_signup.dart';
import 'package:messagesapp/views/screens/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is Login
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          //user is Not Login
          else {
            return LoginOrSignup();
          }
        },
      ),
    );
  }
}
