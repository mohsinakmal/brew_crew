

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    
    final brews = Provider.of<QuerySnapshot>(context);
    //print(brews.docs);
    for(var doc in brews.docs){
      print(doc.data());
    }
    
    return Container();

  }
}
