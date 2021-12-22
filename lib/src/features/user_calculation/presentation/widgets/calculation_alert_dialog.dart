import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/features/user_calculation/data/models/part_of_kitchen.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/blocs/bloc/firebasecounter_bloc.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/blocs/bloc/kitchen_bloc.dart';

class CalculationAlertDialog extends StatefulWidget {
  const CalculationAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  _CalculationAlertDialogState createState() => _CalculationAlertDialogState();
}

class _CalculationAlertDialogState extends State<CalculationAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseCounterBloc, FirebasecounterState>(
        builder: (context, state) {
      if (state is FirebasePartsCalculatedState) {
        return AlertDialog(
          title: Text(
            AppLocalization.of(context)!
                    .getTranslatedValues('Die Küchenmontage beträgt ca.') +
                '${state.kitchenPrice} €',
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 24),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  BlocProvider.of<KitchenBloc>(context).add(FirstKitchenEvent(
                      partsOfKitchenList: PartOfKitchen.getList()));
                },
                child: Text(AppLocalization.of(context)!
                    .getTranslatedValues('Abbrechen'))),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'client_form_screen');
              },
              child: Text(AppLocalization.of(context)!
                  .getTranslatedValues('Zur Zusammenfassung')),
            )
          ],
        );
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
