import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:profi_neon/src/features/user_calculation/data/models/part_of_kitchen.dart';

part 'kitchen_event.dart';
part 'kitchen_state.dart';

class KitchenBloc extends Bloc<KitchenEvent, KitchenState> {
  List<PartOfKitchen>? partsOfKitchenList;
  KitchenBloc() : super(KitchenInitial());

  @override
  Stream<KitchenState> mapEventToState(
    KitchenEvent event,
  ) async* {
    if (event is InitialKitchenEvent) {
      partsOfKitchenList = event.partsOfKitchenList;
      yield KitchenMain(partsOfKitchenList!);
    }
    if (event is KitchenItemsActivationEvent) {
      partsOfKitchenList = event.partsOfKitchenList;
      yield KitchenMain(partsOfKitchenList!);
    }
    if (event is KitchenItemsDeactivationEvent) {
      for (var i = 0; i < partsOfKitchenList!.length; i++) {
        partsOfKitchenList![i].isActive = false;
      }
      yield KitchenMain(partsOfKitchenList!);
    }
  }
}
