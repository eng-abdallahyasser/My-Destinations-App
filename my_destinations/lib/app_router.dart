import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_destinations/UI/screens/home_screen.dart';
import 'package:my_destinations/UI/screens/login_screen.dart';
import 'package:my_destinations/UI/screens/otp_screen.dart';
import 'package:my_destinations/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:my_destinations/constants/strings.dart';

class AppRouter {
  late PhoneAuthCubit phoneAuthCubit;
  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: phoneAuthCubit,
                  child: LoginScreen(),
                ));
      case otpScreen:
        return MaterialPageRoute(
            builder: (_) =>  BlocProvider.value(
                  value: phoneAuthCubit,
                  child: const OtpScreen(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: Center(child: Text('Route not found'))));
    }
  }
}
