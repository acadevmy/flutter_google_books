import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_google_books/application/services/i_auth_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthService)
class AuthService implements IAuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return;
    }

    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return;
    }

    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
