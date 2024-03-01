import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_google_books/firebase_options.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  @preResolve
  Future<FirebaseApp> initFirebase() async {
    try {
      return await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
