import 'dart:developer';

import 'package:fire16/services/real_db_services/real_db_services.dart';
import 'package:flutter/material.dart';

class AppSideBar extends StatelessWidget {
  const AppSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder(
        future: RealDatabaseServices().get(),
        builder: (context, hasanjon) {
          if (hasanjon.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            );
          } else if (hasanjon.hasError) {
            return const SizedBox();
          } else {
            final user = hasanjon.data;
            log(user.toString());
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(color: Colors.white70),
                            image: user!.photoUrl.isNotEmpty
                                ? DecorationImage(
                                    image: NetworkImage(user.photoUrl),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: user.photoUrl.isEmpty
                              ? const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 36,
                                )
                              : null,
                        ),
                        Text(
                          "${user.name} ${user.surname}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )),
                ListTile(
                  leading: const Icon(
                    Icons.account_circle_outlined,
                  ),
                  title: const Text('Akkaunt'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
