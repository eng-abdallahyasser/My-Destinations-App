import 'package:flutter/material.dart';
import 'package:my_destinations/UI/screens/home_screen.dart';
import 'package:my_destinations/UI/screens/login_screen.dart';
import 'package:my_destinations/UI/screens/otp_screen.dart';
import 'package:my_destinations/constants/strings.dart';

class AppRouter {

  
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
      case loginScreen:
      return MaterialPageRoute(builder: (_) => LoginScreen());
      case otpScreen:
      return MaterialPageRoute(builder: (_) => OtpScreen());
      default:
      return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Route not found'))));
    }
  }
}
