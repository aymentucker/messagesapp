// lib/routes/route_page_builder.dart

import 'package:flutter/material.dart';
import 'package:messagesapp/auth/login_or_signup.dart';
import 'package:messagesapp/views/screens/home_screen.dart';
import 'package:messagesapp/views/screens/login_screen.dart';
import 'route_names.dart';

class AppRoutePageBuilder {
  static Map<String, WidgetBuilder> get routes {
    return {
      RouteNames.login: (context) => LoginScreen(),
      RouteNames.home: (context) => HomeScreen(),
      RouteNames.loginOrSignup: (context) => LoginOrSignup(),
      // Define other routes in similar fashion
    };
  }
}
