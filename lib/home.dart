import 'dart:developer';

import 'package:fire16/firebase_db_services.dart';
import 'package:fire16/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                User newUser = User(
                  name: "Aziz Sultonov",
                  adress: "Buxoro",
                  height: 1.54,
                  job: "Developer",
                  age: 14,
                );

                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.get().then((value) {
                  for (final item in value) {
                    if (item.name == "Zamon") {
                      newUser.id = item.id;
                      databaseServices.update(newUser);
                    }
                  }
                });
              },
              child: const Text("Update"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.get().then((value) {
                  for (final item in value) {
                    log(item.name);
                  }
                });
              },
              child: const Text("Get User"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                User user = User(
                  name: "Ahmad",
                  adress: "Andijon",
                  height: 1.99,
                  job: "Null",
                  age: 29,
                );

                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.add(user);
              },
              child: const Text("Add"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.get().then((value) {
                  for (final item in value) {
                    if (item.name == "Ruhiddin") {
                      databaseServices.delete(item.id ?? "");
                    }
                  }
                });
              },
              child: const Text("Delete"),
            ),
          ),
        ],
      ),
    );
  }
}


