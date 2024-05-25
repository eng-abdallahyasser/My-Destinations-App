import 'package:flutter/material.dart';
import 'package:my_destinations/UI/screens/home_screen.dart';
import 'package:my_destinations/UI/screens/login_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/login':
      return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
      return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Route not found'))));
    }
  }
}
