import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;

  SignIn({this.toggleView});


  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<SignIn > {

  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  // Text field state
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
        actions: [
          FlatButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Register"),)
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              TextFormField(
                decoration:textInputDecoration.copyWith(hintText: "Email"),
                validator: (val) => val .isEmpty ? "Enter the correct email" : null,
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration:textInputDecoration.copyWith(hintText: "Password"),
                validator: (val) => val.length < 6 ? "Enter a password 6+ chars long" : null,
                obscureText: true,
                onChanged:(val){
                  setState(() {
                    password = val;
                  });
                } ,
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                  onPressed: () async{
                    if(_formKey.currentState.validate()){
                      loading = true;
                      setState(() {

                      });
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null){
                        loading = false;
                        error = "Could not sign in with those credentials";
                        setState(() {
                        });
                      }
                    }
                  },
                color: Colors.pink[400],
                child: Text("Sign In",
                style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
