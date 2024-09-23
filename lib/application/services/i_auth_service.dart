abstract class IAuthService {
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  });
}
