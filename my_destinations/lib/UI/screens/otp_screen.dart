import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_destinations/constants/my_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  final _phoneNumber = '+201023684509';

  Widget _bluidIntroTexts() {
    return Column(children: [
      const Text(
        'Verify your phone number',
        style: TextStyle(
          fontSize: 32,
          color: MyColors.myBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      RichText(
          text: TextSpan(
              text: 'Enter your 6 digits code number sent to ',
              style: const TextStyle(
                fontSize: 24,
                color: MyColors.myBlack,
              ),
              children: [
            TextSpan(
                text: _phoneNumber,
                style: const TextStyle(
                  fontSize: 24,
                  color: MyColors.myTeal,
                ))
          ]))
    ]);
  }

  Widget _bluidPinCodeField(BuildContext cntx) {
    return PinCodeTextField(
      appContext: cntx,
      autoFocus: true,
      cursorColor: MyColors.myBlack,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: MyColors.myTeal,
        inactiveColor: MyColors.myTeal,
        inactiveFillColor: MyColors.myTeal,
        selectedColor: MyColors.myWhite,
        selectedFillColor: MyColors.myWhite,
        activeFillColor: MyColors.myWhite,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: MyColors.myWhite,
      enableActiveFill: true,
      onCompleted: (code) {
        // otpCode = code;
      },
      onChanged: (value) {},
    );
  }

  Widget _bluidVerifyButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(120, 50),
            backgroundColor: MyColors.myBlack,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        child: const Text(
          'Verify',
          style: TextStyle(fontSize: 18, color: MyColors.myWhite),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.myWhite,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 80, 32, 0),
          child: Column(
            children: [
              _bluidIntroTexts(),
              const SizedBox(height: 60),
              _bluidPinCodeField(context),
              const SizedBox(height: 16),
              _bluidVerifyButton()
            ],
          ),
        ),
      ),
    );
  }
}
