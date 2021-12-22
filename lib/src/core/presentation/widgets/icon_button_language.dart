import 'package:flutter/material.dart';

class IconButtonLanguage extends StatelessWidget {
  final String imagepath;
  final String language;
  final VoidCallback chooseLanguage;
  final BoxBorder? iconBorder;

  const IconButtonLanguage({
    required this.language,
    required this.imagepath,
    required this.chooseLanguage,
    required this.iconBorder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), border: iconBorder),
      child: IconButton(
          iconSize: 20,
          onPressed: chooseLanguage,
          icon: Image.asset(imagepath)),
    );
  }
}
