import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/user_calculation/data/models/part_of_kitchen.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/blocs/bloc/firebasecounter_bloc.dart';

class RequestSumUp extends StatefulWidget {
  @override
  _RequestSumUpState createState() => _RequestSumUpState();
}

class _RequestSumUpState extends State<RequestSumUp> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<FirebaseCounterBloc>(context)
        .add(ZeroFirebaseEvent(partsOfKitchenList: PartOfKitchen.getList()));
  }

  Color checkItemStatus(bool isActive) {
    if (isActive) {
      return appleDark;
    }
    return cherry;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseCounterBloc, FirebasecounterState>(
      builder: (context, state) {
        if (state is FirebaseSumUpState) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  AppLocalization.of(context)!
                          .getTranslatedValues('Der Gesamtpreis beträgt ca.') +
                      ' ${state.totalKitchenPrice} €',
                  style: Theme.of(context).textTheme.headline3,
                ),
                tileColor: lightBlueGrey,
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                itemCount: state.partsOfKitchenList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                  tileColor: lightBlueGrey,
                  title: Text(AppLocalization.of(context)!.getTranslatedValues(
                      state.partsOfKitchenList[index].partName)),
                  leading: Icon(
                    Icons.circle,
                    color: inkBrighter,
                  ),
                  subtitle: Text(
                    state.partsOfKitchenList[index].isActive
                        ? AppLocalization.of(context)!.getTranslatedValues('Ja')
                        : AppLocalization.of(context)!
                            .getTranslatedValues('Nein'),
                    style: TextStyle(
                        color: checkItemStatus(
                            state.partsOfKitchenList[index].isActive)),
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
