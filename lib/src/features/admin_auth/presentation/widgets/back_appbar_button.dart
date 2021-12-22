import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

class BackAppBarButton extends StatelessWidget {
  const BackAppBarButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
      color: corp,
    );
  }
}