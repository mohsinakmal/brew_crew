

import 'package:brew_crew/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // Return either home or authenticate widget
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }

  }
}
