import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<UserCredential> login() async {
    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print('\nCREDENCIAIS');
      print(googleAuth.accessToken);
      print(googleAuth.idToken);

      return FirebaseAuth.instance.signInWithCredential(credential);
    }

    throw Exception('Erro ao realizar login com o Google.');
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}
