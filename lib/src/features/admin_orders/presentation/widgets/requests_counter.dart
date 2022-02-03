import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

class RequestsCounter extends StatelessWidget {
  final String text;
  const RequestsCounter({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: lime,
            border: Border.all(width: 2)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ));
  }
}
