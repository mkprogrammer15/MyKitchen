part of 'kitchen_bloc.dart';

abstract class KitchenEvent extends Equatable {
  const KitchenEvent();

  @override
  List<Object> get props => [];
}

class ZeroKitchenEvent extends KitchenEvent {
  final List<PartOfKitchen> partsOfKitchenList;

  ZeroKitchenEvent({required this.partsOfKitchenList});
}

class FirstKitchenEvent extends KitchenEvent {
  final List<PartOfKitchen> partsOfKitchenList;

  FirstKitchenEvent({required this.partsOfKitchenList});
  @override
  List<Object> get props => [partsOfKitchenList];
}

class SecondKitchenEvent extends KitchenEvent {
  final List<PartOfKitchen> partsOfKitchenList;

  SecondKitchenEvent(this.partsOfKitchenList);
}
