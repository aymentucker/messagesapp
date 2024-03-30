import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messagesapp/auth/login_or_signup.dart';
import 'package:messagesapp/firebase_options.dart';
import 'package:messagesapp/providers/theme_provider.dart';
import 'package:messagesapp/services/shared_prefs_manager.dart';
import 'package:provider/provider.dart';
import 'package:messagesapp/utils/routes/route_page_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefsManager.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const LoginOrSignup(),
      routes:
          AppRoutePageBuilder.routes, // Use the centralized route definitions
    );
  }
}
