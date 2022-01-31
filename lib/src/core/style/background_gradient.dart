import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

class BackGroundGradient extends StatelessWidget {
  final Widget child;

  const BackGroundGradient({
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [limeBright, corp],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      )),
      child: child,
    );
  }
}
