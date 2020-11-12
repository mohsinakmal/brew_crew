import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<SignIn > {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RaisedButton(
          child: Text("Sign In Anon"),
          onPressed: () async{
            dynamic conclusion = await _auth.signInAnon();
            if(conclusion == null){
              print("error signing in");
            }else{
              print("Signed In");
              print(conclusion);
            }
          },
        ),
      ),
    );

  }
}
