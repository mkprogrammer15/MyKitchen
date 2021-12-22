import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

Container getAvatar() {
  return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: avatarRad,
          border:
              Border.all(color: Colors.lightBlueAccent.shade100, width: 1.2),
          image: const DecorationImage(
              image: AssetImage('assets/images/kontakt.jpg'),
              fit: BoxFit.cover)));
}
