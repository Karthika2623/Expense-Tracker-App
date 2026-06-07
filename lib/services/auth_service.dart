import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> login(

      String email,
      String password,

      ) async {

    return await auth.signInWithEmailAndPassword(

      email: email,
      password: password,

    );

  }

  Future<UserCredential> register(String email, String password,) async {
    return await auth.createUserWithEmailAndPassword(
      email: email, password: password,
    );
  }

  Future<void> logout() async {

    await auth.signOut();

  }

}