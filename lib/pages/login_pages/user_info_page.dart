import 'dart:io';
import 'package:fire16/constants/app_colors.dart';
import 'package:fire16/firebase_storage_services.dart';
import 'package:fire16/home.dart';
import 'package:fire16/models/user_model.dart';
import 'package:fire16/services/real_db_services/real_db_services.dart';
import 'package:fire16/utils/app_id_generator.dart';
import 'package:fire16/utils/app_loader.dart';
import 'package:fire16/utils/app_router.dart';
import 'package:fire16/widgets/app_main_button.dart';
import 'package:fire16/widgets/app_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoPage extends StatefulWidget {
  static const String id = "user_info_page";

  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final imagePicker = ImagePicker();
  final name = TextEditingController();
  final surname = TextEditingController();
  final username = TextEditingController();
  final bio = TextEditingController();
  String path = "";

  void pickImage() async {
    await imagePicker
        .pickImage(
      source: ImageSource.gallery,
    )
        .then((value) {
      if (value != null) {
        setState(() {
          path = value.path;
        });
      }
    });
  }

  void addToDatabase() async {
    showLoader(context);
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final userID = firebaseAuth.currentUser!.uid;
    RealDatabaseServices databaseServices = RealDatabaseServices();
    FirebaseStorageServices storageServices = FirebaseStorageServices();
    final imageUrl = await storageServices.upload(File(path));
    UserModel userModel = UserModel(
      id: userID,
      name: name.text.trim(),
      surname: surname.text.trim(),
      photoUrl: imageUrl ?? "",
      username: username.text.trim(),
      bio: bio.text.trim(),
      lastEnteredToApp: Token.now(),
      online: true,
    );
    databaseServices.add(userModel).then((value) {
      Go(context).close();
      Go(context).id(HomePage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Center(
                child: GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(color: mainColor),
                      image: path.isNotEmpty
                          ? DecorationImage(
                              image: FileImage(File(path)),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: path.isEmpty
                        ? const Icon(
                            Icons.camera_alt_outlined,
                            size: 32,
                            color: Colors.black,
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              AppTextField(hint: "Ism", controller: name),
              const SizedBox(height: 12),
              AppTextField(hint: "Familiya", controller: surname),
              const SizedBox(height: 12),
              AppTextField(hint: "@Username", controller: username),
              const SizedBox(height: 12),
              AppTextField(hint: "Bio", controller: bio),
              const SizedBox(height: 48),
              AppMainButton(title: "Joylash", onPressed: addToDatabase),
            ],
          ),
        ),
      ),
    );
  }
}
