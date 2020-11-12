

import 'package:brew_crew/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home.dart';
import 'package:flutter/cupertino.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Return either home or authenticate widget
    return Authenticate();

  }
}
