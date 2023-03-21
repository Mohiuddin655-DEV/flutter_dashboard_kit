import 'package:firebase_auth/firebase_auth.dart';

import '../../../feature/domain/entities/credential.dart';
import '../log_builders/log_builder.dart';
import '../responses/response.dart';

abstract class AuthDataSource {
  Future<bool> isSignIn();

  Future<Response> signOut();

  String? get uid;

  User? get user;

  Future<Response<UserCredential>> signInWithCredential({
    required AuthCredential credential,
  });

  Future<Response<UserCredential>> signUpWithEmailNPassword({
    required String email,
    required String password,
  });

  Future<Response<UserCredential>> signInWithEmailNPassword({
    required String email,
    required String password,
  });

  Future<Response<ConfirmationResult>> signInWithPhoneNumber({
    required String phoneNumber,
    RecaptchaVerifier? verifier,
  });

  Stream<Response<PhoneAuthCredential>> verifyPhoneNumber({
    required String phoneNumber,
  });

  Future<Response<Credential>> signInWithFacebook();

  Future<Response<Credential>> signInWithGoogle();

  Future<Response<bool>> signInWithBiometric();

  LogBuilder get log => LogBuilder("auth_data_source");
}
