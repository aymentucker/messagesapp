import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:messagesapp/services/auth_service.dart';
import 'package:provider/provider.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class SignupScreen extends StatefulWidget {
  final void Function()? onTap;
  const SignupScreen({super.key, this.onTap});

  @override
  // ignore: library_private_types_in_public_api
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmedPasswordController = TextEditingController();

  // Firebase Auth instance
  final _auth = FirebaseAuth.instance;

  //signup

  void signUp() async {
    if (passwordController.text != confirmedPasswordController.text) {
      Fluttertoast.showToast(
          msg: "Passwords do not match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    } else {
      //get auth Service
      final authService = Provider.of<AuthService>(context, listen: false);
      try {
        // Attempt to sign in the user with Firebase Auth
        await authService.signUp(
            emailController.text.trim(), passwordController.text);
      } on FirebaseAuthException catch (e) {
        // If there's an error, display a message to the user
        print(e
            .message); // Consider using something like Fluttertoast for user feedback
        Fluttertoast.showToast(msg: e.message ?? "An error occurred");
      }
    }
  }

  // void _signUp() async {
  //   try {
  //     if (passwordController.text == confirmedPasswordController.text) {
  //       final newUser = await _auth.createUserWithEmailAndPassword(
  //         email: emailController.text,
  //         password: passwordController.text,
  //       );
  //       if (newUser.user != null) {
  //         // User created successfully, navigate to your next screen
  //         Navigator.of(context).pushReplacementNamed('/home');
  //       }
  //     } else {
  //       // Show toast message when passwords do not match
  //       Fluttertoast.showToast(
  //           msg: "Passwords do not match",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     }
  //   } catch (e) {
  //     // Handle errors, possibly show an alert to the user
  //     print(e);
  //     Fluttertoast.showToast(
  //         msg: e.toString(),
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
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
              'Create New Account',
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
              height: 10,
            ),
            //Textfield Email
            MyTextfield(
              controller: confirmedPasswordController,
              obscureText: true,
              hint: 'Confirmed Password',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 15,
            ),
            //Login Button
            MyButton(
              text: "Sign Up",
              onTap: signUp,
            ),
            const SizedBox(
              height: 8,
            ),
            // dont have account? Register Now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Have account?'),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                    onTap: widget.onTap, child: const Text('Login Now')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
