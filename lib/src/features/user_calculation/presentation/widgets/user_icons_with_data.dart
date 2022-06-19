import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/user_calculation/data/models/part_of_kitchen.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/blocs/bloc/kitchen_bloc.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/widgets/client_icon_button.dart';

class UserIconsWithData extends StatefulWidget {
  const UserIconsWithData({
    Key? key,
  }) : super(key: key);

  @override
  _UserIconsWithDataState createState() => _UserIconsWithDataState();
}

class _UserIconsWithDataState extends State<UserIconsWithData> {
  void onIconTap() {
    setState(() {
      BlocProvider.of<KitchenBloc>(context).add(KitchenItemsActivationEvent(partsOfKitchenList: PartOfKitchen.getList()));
    });
  }

  void showSnackBar(BuildContext context, String snackBarText) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        snackBarText,
        style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 24),
        textAlign: TextAlign.center,
      ),
      backgroundColor: lightBlueGrey,
      duration: const Duration(milliseconds: 150),
      shape: const StadiumBorder(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Center(
          child: BlocBuilder<KitchenBloc, KitchenState>(
            builder: (context, state) {
              if (state is KitchenMain) {
                return ClientIconButton(
                  onPressed: () {
                    state.partsOfKitchenList[index].isActive = !state.partsOfKitchenList[index].isActive;
                    onIconTap();
                    showSnackBar(context, AppLocalization.of(context)!.getTranslatedValues(state.partsOfKitchenList[index].partName));
                  },
                  iconSize: state.partsOfKitchenList[index].partSize,
                  iconColor: state.partsOfKitchenList[index].isActive == true ? blueyGrey : state.partsOfKitchenList[index].colorOfPart,
                  iconName: state.partsOfKitchenList[index].partName,
                  id: state.partsOfKitchenList[index].id,
                  imagePath: state.partsOfKitchenList[index].imagePath,
                  isActive: state.partsOfKitchenList[index].isActive,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    );
  }
}
