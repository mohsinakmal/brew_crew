

import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uId;
  DatabaseService({this.uId});

  // collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection("brews");


  Future updateUserData(String sugars, int strength, String name) async{
    return await brewCollection.doc(uId).set({
      'sugars' : sugars,
      'strength' : strength,
      'name' : name,
    });
  }

  // Brew list from snapshot
  List<Brew>_brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Brew(
        sugar: doc.data()['sugar'] ?? '',
        strength: doc.data()['strength'] ?? 0,
        name: doc.data()['name'] ?? "",
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews{
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
  }

}