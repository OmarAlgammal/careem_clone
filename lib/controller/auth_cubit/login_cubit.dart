import 'package:careem_clone/services/auth_services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_states/auth_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authServices) : super(LoginInitialState());

  final AuthServices _authServices;

  late String _verificationId;

  static LoginCubit instance(context) => BlocProvider.of<LoginCubit>(context);

  Future<void> signInWithMobileNumber({required String mobileNumber}) async {
    emit(VerifyingMobileNumber());
    _authServices.signInWithMobileNumber(
      mobileNumber: mobileNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        emit(PhoneNumberHasBeenVerified());
        await _authServices.signInWithCredential(credential: credential);
      },
      verificationFailed: (FirebaseAuthException exception) {
        emit(VerificationFailed(errorMessage: exception.message.toString()));
      },
      codeSent: (String verificationId, int? codeSent) {
        _verificationId = verificationId;
        emit(PhoneNumberHasBeenVerified());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        emit(CodeAutoRetrievalTimedOut(
            errorMessage: 'Code auto retrieval timed out'));
      },
    );
  }

  Future<void> submitOTP({required String otpCode}) async {
    emit(VerifyingOtp());

    /// Submit otp
    final credentialResult = _authServices.submitOTP(
        verificationId: _verificationId, otpCode: otpCode);

    /// Sign in with credentials if otp submitted successfully
    if (credentialResult.isRight) {
      await _authServices
          .signInWithCredential(credential: credentialResult.right)
          .then((value) => value.isRight
              ? emit(UserLoggedInSuccessfully())
              : emit(FailedToLogin(errorMessage: 'Failed to login')));
    } else {
      emit(VerificationFailed(errorMessage: credentialResult.left.message));
    }
  }

  Stream<User?> authStateChanges() {
    return _authServices.authStateChanges();
  }
}
