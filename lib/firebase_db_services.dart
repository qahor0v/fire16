import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire16/user_model.dart';

class DatabaseServices {
  String collectionName = "player";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///Add
  Future<void> add(User user) async {
    final collection = firestore.collection(collectionName);
    await collection.add(user.toJson());
  }

  ///Get
  Future<List<User>> get() async {
    List<User> users = [];
    final collection = firestore.collection(collectionName);
    final result = await collection.get();
    for (final item in result.docs) {
      try {
        User user = User.fromJson(item.data());
        user.id = item.id;

        users.add(user);
      } catch (error) {
        log("$error");
      }
    }
    return users;
  }

  ///Update
  Future<void> update(User user) async {
    final collection = firestore.collection(collectionName);
    collection.doc(user.id).update(user.toJson());
  }

  ///Delete
  Future<void> delete(String id) async {
    final collection = firestore.collection(collectionName);
    collection.doc(id).delete();
  }
}
