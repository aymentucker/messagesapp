import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:messagesapp/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({super.key, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance; // Add this

  void singIn() async {
    //get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      // Attempt to sign in the user with Firebase Auth
      await authService.signIn(
          emailController.text.trim(), passwordController.text);
    } on FirebaseAuthException catch (e) {
      // If there's an error, display a message to the user
      print(e
          .message); // Consider using something like Fluttertoast for user feedback
      Fluttertoast.showToast(msg: e.message ?? "An error occurred");
    }
  }

  // void signin() async {
  //   try {
  //     // Attempt to sign in the user with Firebase Auth
  //     final UserCredential userCredential =
  //         await _auth.signInWithEmailAndPassword(
  //       email: emailController.text
  //           .trim(), // Use trim() to remove any leading/trailing whitespace
  //       password: passwordController.text,
  //     );

  //     if (userCredential.user != null) {
  //       // If the sign-in was successful, navigate to the HomeScreen
  //       Navigator.of(context).pushReplacementNamed('/home');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     // If there's an error, display a message to the user
  //     print(e
  //         .message); // Consider using something like Fluttertoast for user feedback
  //     // For example:
  //     // Fluttertoast.showToast(msg: e.message ?? "An error occurred");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            const Icon(
              Icons.lock_open_outlined,
              size: 100,
            ),
            const SizedBox(
              height: 25,
            ),
            // Wellcome
            Text(
              'wellcome Back',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),
            //Textfield Email
            MyTextfield(
              controller: emailController,
              obscureText: false,
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            //Textfield Pass
            const SizedBox(
              height: 10,
            ),
            //Textfield Email
            MyTextfield(
              controller: passwordController,
              obscureText: true,
              hint: 'Password',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 15,
            ),
            //Login Button
            MyButton(
              text: "Sign In",
              onTap: singIn,
            ),
            const SizedBox(
              height: 8,
            ),
            // dont have account? Register Now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have account?'),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                    onTap: widget.onTap, child: const Text('Register Now')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
