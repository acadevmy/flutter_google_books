import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseAuthInjectableModule {
  @preResolve
  Future<FirebaseAuth> firebaseAuth() async => FirebaseAuth.instance;
}
