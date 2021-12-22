import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/user_calculation/data/models/part_of_kitchen.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/blocs/bloc/firebasecounter_bloc.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/blocs/bloc/kitchen_bloc.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/widgets/calculation_alert_dialog.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/widgets/input_kitchen_size.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/widgets/user_icons_with_data.dart';

class UserCalculation extends StatefulWidget {
  @override
  _UserCalculationState createState() => _UserCalculationState();
}

class _UserCalculationState extends State<UserCalculation> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<KitchenBloc>(context)
        .add(ZeroKitchenEvent(partsOfKitchenList: PartOfKitchen.getList()));
  }

  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _kitchenSizeController = TextEditingController();

  @override
  void dispose() {
    _kitchenSizeController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: userCalcPad1, child: UserIconsWithData()),
        // ignore: sized_box_for_whitespace
        Container(
          width: 230,
          child: FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child:
                InputKitchenSize(kitchenSizeController: _kitchenSizeController),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {}
            setState(() {
              BlocProvider.of<FirebaseCounterBloc>(context).add(
                  FirstFirebaseEvent(
                      partsOfKitchenList: PartOfKitchen.getList(),
                      kitchenSize: double.parse(_kitchenSizeController.text)));
            });
            showDialog<void>(
                context: context,
                builder: (context) {
                  return const CalculationAlertDialog();
                });
          },
          style: ElevatedButton.styleFrom(primary: inkDark),
          child: Text(
            AppLocalization.of(context)!.getTranslatedValues('Berechnen'),
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    );
  }
}
