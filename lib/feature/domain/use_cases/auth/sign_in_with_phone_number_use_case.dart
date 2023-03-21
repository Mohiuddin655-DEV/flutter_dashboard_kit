import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/common/responses/response.dart';
import '../../repositories/auth_repository.dart';

class SignInWithPhoneNumberUseCase {
  final AuthRepository repository;

  SignInWithPhoneNumberUseCase({
    required this.repository,
  });

  Future<Response<ConfirmationResult>> call({
    required String phoneNumber,
  }) async {
    return repository.signInWithPhoneNumber(
      phoneNumber: phoneNumber,
    );
  }
}
