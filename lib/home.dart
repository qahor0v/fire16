import 'dart:developer';

import 'package:fire16/firebase_db_services.dart';
import 'package:fire16/rtdb_services.dart';
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
                RealDbServices ser = RealDbServices();
                ser.get('912').then((value) {
                  log("${value}");
                });
              },
              child: const Text("Get User"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                User user = User(
                  name: "iorhyudkhfdfhb",
                  adress: "auishfudsbb ",
                  height: 1.999999,
                  job: "Null",
                  age: 29,
                  id: "912",
                );

                RealDbServices services = RealDbServices();
                services.add(user);
              },
              child: const Text("Add"),
            ),
          ),

        ],
      ),
    );
  }
}
