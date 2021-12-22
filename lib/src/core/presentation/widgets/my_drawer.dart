import 'package:flutter/material.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/presentation/widgets/get_card.dart';
import 'package:profi_neon/src/core/style/background_gradient.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 24,
      child: Padding(
        padding: drawerPadding1,
        child: BackGroundGradient(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalization.of(context)!
                    .getTranslatedValues('Unsere Kontaktdaten'),
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 16),
              ),
              getCard(),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/kuehlschrank.png'),
                    Image.asset('assets/images/ofen.png'),
                    Image.asset('assets/images/schrank.png'),
                    Image.asset('assets/images/spuelmaschine.png'),
                    Image.asset('assets/images/waschmaschine.png')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
