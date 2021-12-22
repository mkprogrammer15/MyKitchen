import 'package:flutter/material.dart';
import 'package:profi_neon/src/app_localizations.dart';

class InputKitchenSize extends StatelessWidget {
  const InputKitchenSize({
    Key? key,
    required TextEditingController kitchenSizeController,
  })  : _kitchenSizeController = kitchenSizeController,
        super(key: key);

  final TextEditingController _kitchenSizeController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _kitchenSizeController,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return AppLocalization.of(context)!
              .getTranslatedValues('Die Küchenlänge soll mindestens 1m sein');
        }
        return null;
      },
      decoration: InputDecoration(
          hintText:
              AppLocalization.of(context)!.getTranslatedValues('In Meter'),
          labelText: AppLocalization.of(context)!
              .getTranslatedValues('Wie lang ist Ihre Küche?'),
          suffixIcon: Icon(Icons.linear_scale)),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
    );
  }
}
