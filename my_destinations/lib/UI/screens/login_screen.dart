import 'package:flutter/material.dart';
import 'package:my_destinations/constants/my_colors.dart';
import 'package:my_destinations/constants/strings.dart';
import 'package:my_destinations/helpers/strings_transformer.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  String _phone = '+201023684509';

  Widget _bluidIntroTexts() {
    return const Column(children: [
      Text(
        'Welcome to My Destinations App',
        style: TextStyle(
          fontSize: 32,
          color: MyColors.myBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        'Please, Enter your phone number to verfiy your account.',
        style: TextStyle(
          fontSize: 24,
          color: MyColors.myBlack,
        ),
      ),
    ]);
  }

  Widget _bluidPhoneFormField() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                  border: Border.all(color: MyColors.myBlack),
                  borderRadius: const BorderRadius.all(Radius.circular(6))),
              child: Text(
                "${StringsTransformer.countryCodeToFlag('eg')} +20",
                style: const TextStyle(fontSize: 18),
              )),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 3,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                  border: Border.all(color: MyColors.mySoftBlack),
                  borderRadius: const BorderRadius.all(Radius.circular(6))),
              child: TextFormField(
                autofocus: true,
                style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 4,
                ),
                decoration: const InputDecoration(border: InputBorder.none),
                cursorColor: MyColors.myBlack,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number!';
                  } else if (value.length > 11) {
                    return 'Too short for a phone number!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phone = value!;
                },
              )),
        ),
      ],
    );
  }

  Widget _bluidNextButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, otpScreen);
        },
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(120, 50),
            backgroundColor: MyColors.myBlack,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        child: const Text(
          'Next',
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
        body: Form(
          key: _phoneFormKey,
          child: Container(
            margin: const EdgeInsets.fromLTRB(32, 80, 32, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bluidIntroTexts(),
                const SizedBox(height: 60),
                _bluidPhoneFormField(),
                const SizedBox(height: 16),
                _bluidNextButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
