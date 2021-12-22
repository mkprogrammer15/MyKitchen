import 'package:flutter/material.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/presentation/widgets/information.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/widgets/user_calculation.dart';

class ClientCounterScreen extends StatefulWidget {
  static const routeName = 'client_counter_screen';
  @override
  _ClientCounterScreenState createState() => _ClientCounterScreenState();
}

class _ClientCounterScreenState extends State<ClientCounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BuildMyKitchen',
          style: Theme.of(context).textTheme.headline1,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: corp,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Information(AppLocalization.of(context)!.getTranslatedValues(
                  'Bitte wählen Sie die gewünschten Leistungen des Handwerkers aus.\nBerechnen Sie den Montagepreis!')),
              UserCalculation(),
            ],
          ),
        ),
      ),
    );
  }
}
