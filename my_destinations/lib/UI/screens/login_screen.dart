import 'package:flutter/material.dart';
import 'package:my_destinations/constants/my_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

Widget _bluidIntroTexts() {
  return const Column(
    children: [
      Text(
        'Welcome to',
        style: TextStyle(
          fontSize: 36,
          color: MyColors.myBlack,
          fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'My Destinations',
            style: TextStyle(
              fontSize: 24,
              color: MyColors.myBlack,

            ),
            ),
    ]
    );
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.myWhite,
        body: Form(
          key: UniqueKey(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32,vertical: 88),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bluidIntroTexts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


