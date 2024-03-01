import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

@module
abstract class FirebaseAuthModule {
  @preResolve
  Future<FirebaseAuth> firebaseAuth() async {
    try {
      return FirebaseAuth.instance;
    } catch (e) {
      throw Exception(e);
    }
  }
}
