import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  static final _auth = FirebaseAuth.instance;
  static User? get currentUser => _auth.currentUser;

  static Future<void> loginAdmin(email, password) async{
    final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> logout() async{
    return await _auth.signOut();
  }
}