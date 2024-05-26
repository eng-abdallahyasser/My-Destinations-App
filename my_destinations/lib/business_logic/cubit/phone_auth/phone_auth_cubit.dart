import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;
  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> submitPhoneNumber() async {
    emit(Loading() as PhoneAuthState);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+201023684509',
      verificationCompleted: (PhoneAuthCredential credential) {
        signIn(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(ErrorOccured(message: e.toString()));
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        emit(PhoneNumberSubmitted());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> submitOtp(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOtpVerified());
    } catch (error) {
      emit(ErrorOccured(message: error.toString()));
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLogedInUser() {
    return FirebaseAuth.instance.currentUser!;
  }
}
