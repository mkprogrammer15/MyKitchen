import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

mixin ImageDataService<T extends StatefulWidget> on State<T> {
  File? thisImage;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      } else {
        setState(() {
          final imageTemporary = File(image.path);
          thisImage = imageTemporary;
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick the image: $e');
    }
  }

  String imageDownloadUrl = '';

  Future updloadImageToFirebase(BuildContext context) async {
    if (thisImage == null) {
      return;
    }
    final fileName = basename(thisImage!.path);
    final firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    final uploadTask = firebaseStorageRef.putFile(thisImage!);
    final taskSnapshot = await uploadTask;
    imageDownloadUrl =
        await taskSnapshot.ref.getDownloadURL().then((value) => value);
  }
}
