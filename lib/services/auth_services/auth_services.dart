import 'package:careem_clone/core/network/failures/server_failure.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class BaseAuthService {
  Future<void> signInWithMobileNumber(
      {required String mobileNumber,
      required Function(PhoneAuthCredential) verificationCompleted,
      required Function(FirebaseAuthException) verificationFailed,
      required void Function(String verificationId, int? resendToken) codeSent,
      required void Function(String verificationId) codeAutoRetrievalTimeout});

  Either<ServerFailure, PhoneAuthCredential> submitOTP(
      {required String verificationId, required String otpCode});

  Future<Either<ServerFailure, User>> signInWithCredential(
      {required PhoneAuthCredential credential});

  Stream<User?> authStateChanges();

  User getUser();

  void logOut();
}

class AuthServices implements BaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signInWithMobileNumber(
      {required String mobileNumber,
      required Function(PhoneAuthCredential) verificationCompleted,
      required Function(FirebaseAuthException) verificationFailed,
      required void Function(String verificationId, int? resendToken) codeSent,
      required void Function(String verificationId)
          codeAutoRetrievalTimeout}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: mobileNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  User getUser() {
    return _firebaseAuth.currentUser!;
  }

  @override
  Either<ServerFailure, PhoneAuthCredential> submitOTP(
      {required String verificationId, required String otpCode}) {
    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpCode);
      return Right(credential);
    } on FirebaseException catch(firebaseException){
      return Left(ServerFailure(message: firebaseException.code + firebaseException.message.toString()));
    } catch (e) {
      return Left(ServerFailure(message: 'Error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<ServerFailure, User>> signInWithCredential(
      {required PhoneAuthCredential credential}) async {
    try {
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return Right(userCredential.user!);
    } catch (e) {
      return Left(ServerFailure(message: 'Error: ${e.toString()}'));
    }
  }

  @override
  void logOut() {
    _firebaseAuth.signOut();
  }

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();
}
