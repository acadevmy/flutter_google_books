import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_google_books/domain/services/i_auth_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthService)
class AuthService implements IAuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  @override
  Future<void> signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return;
    }

    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUp(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return;
    }

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
