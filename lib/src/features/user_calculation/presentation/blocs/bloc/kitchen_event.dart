part of 'kitchen_bloc.dart';

abstract class KitchenEvent extends Equatable {
  const KitchenEvent();

  @override
  List<Object> get props => [];
}

class InitialKitchenEvent extends KitchenEvent {
  final List<PartOfKitchen> partsOfKitchenList;

  const InitialKitchenEvent({required this.partsOfKitchenList});
}

class KitchenItemsActivationEvent extends KitchenEvent {
  final List<PartOfKitchen> partsOfKitchenList;

  const KitchenItemsActivationEvent({required this.partsOfKitchenList});
  @override
  List<Object> get props => [partsOfKitchenList];
}

class SecondKitchenEvent extends KitchenEvent {
  final List<PartOfKitchen> partsOfKitchenList;

  const SecondKitchenEvent(this.partsOfKitchenList);
}
