import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/style/background_gradient.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/user_calculation/data/models/part_of_kitchen.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/blocs/bloc/kitchen_bloc.dart';

class UserPostRequest extends StatelessWidget {
  static const routeName = 'after_request_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundGradient(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  AppLocalization.of(context)!.getTranslatedValues('Vielen Dank für Ihre Anfrage!\nWir melden uns schnellstmöglich bei Ihnen!'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<KitchenBloc>(context).add(SecondKitchenEvent(PartOfKitchen.getList()));
                Navigator.of(context).pushNamed('language_screen');
              },
              style: ElevatedButton.styleFrom(primary: inkDark),
              child: Text(
                'Home',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
