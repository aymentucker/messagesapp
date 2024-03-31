import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messagesapp/services/auth/auth_gate.dart';
import 'package:messagesapp/firebase_options.dart';
import 'package:messagesapp/providers/theme_provider.dart';
import 'package:messagesapp/services/auth/auth_service.dart';
import 'package:messagesapp/services/chat/chat_service.dart';
import 'package:messagesapp/services/shared_prefs_manager.dart';
import 'package:provider/provider.dart';
import 'package:messagesapp/utils/routes/route_page_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize SharedPreferences
  await SharedPrefsManager.init();

  // Run the app with MultiProvider
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(create: (context) => ChatService()),
    ],
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
      home: const AuthGate(),
      routes:
          AppRoutePageBuilder.routes, // Use the centralized route definitions
    );
  }
}
