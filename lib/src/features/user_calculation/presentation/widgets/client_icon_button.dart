import 'package:flutter/material.dart';

class ClientIconButton extends StatelessWidget {
  final String imagePath;
  final int id;
  final String iconName;
  Color iconColor;
  final double iconSize;
  bool isActive;
  VoidCallback onPressed;

  ClientIconButton(
      {required this.isActive,
      required this.imagePath,
      required this.id,
      required this.iconName,
      required this.iconSize,
      required this.iconColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        imagePath,
        color: iconColor,
      ),
      iconSize: iconSize,
    );
  }
}
