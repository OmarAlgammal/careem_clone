import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_states.freezed.dart';

@Freezed()
class LoginState with _$LoginState {
  LoginState._();

  late final String message = 'State message';

  factory LoginState.initialState() = LoginInitialState;

  factory LoginState.verifyingMobileNumber() = VerifyingMobileNumber;

  factory LoginState.phoneNumberHasBeenVerified() = PhoneNumberHasBeenVerified;

  factory LoginState.userLoggedInSuccessfully() = UserLoggedInSuccessfully;

  factory LoginState.invalidPhoneNumber() = InvalidPhoneNumber;

  factory LoginState.verifyingOtp() = VerifyingOtp;

// factory LoginState.verificationFailed({required String errorMessage}) =
//     VerificationFailed;
//
// factory LoginState.codeAutoRetrievalTimeout() = CodeAutoRetrievalTimeout;
//
// factory LoginState.failedToLogin() = FailedToLogin;
}

abstract class LoginErrorState extends Equatable {}

class VerificationFailed extends LoginState implements LoginErrorState {
  VerificationFailed({required this.errorMessage}) : super._();
  final String errorMessage;

  @override
  String get message => errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  bool? get stringify => true;
}

class CodeAutoRetrievalTimedOut extends LoginState implements LoginErrorState {
  final String errorMessage;

  CodeAutoRetrievalTimedOut({required this.errorMessage}) : super._();

  @override
  String get message => errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  bool? get stringify => true;
}

class FailedToLogin extends LoginState implements LoginErrorState {
  final String errorMessage;

  FailedToLogin({required this.errorMessage}) : super._();

  @override
  String get message => errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  bool? get stringify => true;
}
