import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fire16/firebase_storage_services.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String fileName = '';
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(fileName),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  File file = File(result!.files.single.path!);
                  log(file.path);
                  final url = await FirebaseStorageServices().upload(file);
                  log(url.toString());
                }
              },
              child: const Text("Pick file"),
            ),
          )
        ],
      ),
    );
  }
}
