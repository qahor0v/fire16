import 'package:fire16/user_model.dart';
import 'package:firebase_database/firebase_database.dart';

class RealDbServices {
  FirebaseDatabase database = FirebaseDatabase.instance;

  ///Add
  Future<void> add(User user) async {
    DatabaseReference ref = database.ref('users/${user.id}');
    await ref.set(user.toJson());
  }

  ///Add
  Future<void> update(User user) async {
    DatabaseReference ref = database.ref('users/${user.id}');
    await ref.update(user.toJson());
  }

  ///Get
  Future get(String id) async {
    DatabaseReference ref = database.ref('users');
    final data = await ref.child('/$id').get();
    return data.value;
  }

  Future delete(String id) async {
    DatabaseReference ref = database.ref('users');
    await ref.child('/$id').remove();
  }
}
