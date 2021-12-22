import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

class Information extends StatelessWidget {
  final String text;
  const Information(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: informationRad, border: Border.all(color: blueyGrey)),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: informationPadding1,
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: inkDark, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
                decoration: informationBoxDeco,
                child: const Padding(
                  padding: informationPadding1,
                  child: Text(
                    'i',
                    style: informationStyle,
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
