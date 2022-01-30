import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

class BackAppBarButton extends StatelessWidget {
  const BackAppBarButton({
    required this.onpress,
    Key? key,
  }) : super(key: key);
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onpress,
      icon: const Icon(Icons.arrow_back),
      color: corp,
    );
  }
}
