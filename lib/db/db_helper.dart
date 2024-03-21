import 'package:firebase_database/firebase_database.dart';

class DbHelper{
  final _db = FirebaseDatabase.instance;
  final String collectionName = "admin";

  Future<bool> isAdmin(String uid) async{
    final snapshot = await _db.ref().child(collectionName).child(uid).get();
    return snapshot.exists;
    if (snapshot.exists) {
      print("Total Data ${snapshot.value}");
    } else {
      print('No data available.');
    }
  }

}
