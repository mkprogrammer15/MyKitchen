import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/background_gradient.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

class AdminAfterRegistrationScreen extends StatelessWidget {
  static const routeName = 'admin_after_registration_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundGradient(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Vielen Dank!\nIhre Registrierung ist abgeschlossen und wird bearbeitet',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('admin_screen');
              },
              style: ElevatedButton.styleFrom(primary: inkDark),
              child: Text(
                'Zum Login',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
