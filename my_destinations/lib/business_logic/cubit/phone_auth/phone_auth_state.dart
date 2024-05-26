part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

class Loading extends PhoneAuthState{}

class ErrorOccured extends PhoneAuthState{
  final String message;
  ErrorOccured({required this.message});
}

class PhoneNumberSubmitted extends PhoneAuthState{}

class PhoneOtpVerified extends PhoneAuthState{}
