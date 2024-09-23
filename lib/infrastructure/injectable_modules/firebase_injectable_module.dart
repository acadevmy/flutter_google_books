import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_google_books/firebase_options.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseInjectableModule {
  @preResolve
  Future<FirebaseApp> initFirebase() async {
    return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
