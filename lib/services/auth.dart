import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Auth change user stream
  Stream<User> get user{
    return _auth.authStateChanges();
  }

  // Sign in anon
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      String userId = user.uid;
      return userId;
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password

  // Register with email and password

  // Sign out

}