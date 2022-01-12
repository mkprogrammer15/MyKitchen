import 'dart:io';

import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    Key? key,
    required this.image,
    required this.pickImageFromCamera,
    required this.pickImageFromGallery,
  }) : super(key: key);

  final File? image;
  final VoidCallback pickImageFromGallery;
  final VoidCallback pickImageFromCamera;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Haben Sie für uns Fotos der Küche?',
          style: Theme.of(context).textTheme.headline3,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: pickImageFromCamera,
                  style: ElevatedButton.styleFrom(primary: inkDark),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: corp,
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 5,
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: pickImageFromGallery,
                  style: ElevatedButton.styleFrom(primary: inkDark),
                  child: const Icon(
                    Icons.image_outlined,
                    color: corp,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: blueyGrey)),
            height: 150,
            width: double.infinity,
            child: image != null
                ? Image.file(
                    image!,
                    width: 160,
                    height: 160,
                  )
                : const FlutterLogo(),
          ),
        ),
      ],
    );
  }
}
