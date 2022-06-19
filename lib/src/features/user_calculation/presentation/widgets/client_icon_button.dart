import 'package:flutter/material.dart';

class ClientIconButton extends StatelessWidget {
  final String imagePath;
  final int id;
  final String iconName;
  final Color iconColor;
  final double iconSize;
  final bool isActive;
  final VoidCallback onPressed;

  const ClientIconButton({required this.isActive, required this.imagePath, required this.id, required this.iconName, required this.iconSize, required this.iconColor, required this.onPressed});

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          imagePath,
          color: iconColor,
        ),
        iconSize: iconSize,
      );
}
