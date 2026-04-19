import 'package:bookstore/models/user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class UserDao {
  final _databaseRef = FirebaseDatabase.instance.ref("users");

  void saveUser(Users user) {
    _databaseRef.push().set(user.toJson());
  }

  Query getUserQuery() {
    if (!kIsWeb) {
      FirebaseDatabase.instance.setPersistenceEnabled(true);
      //FirebaseDatabase.instance.setPersistenceCacheSizeBytes(10000000);
    }
    return _databaseRef;
  }

  void deleteUser(String key) {
    _databaseRef.child(key).remove();
  }

  void updateUser(String key, Users user) {
    _databaseRef.child(key).update(user.toMap());
  }

  
}
