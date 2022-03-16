part of 'kitchen_bloc.dart';

abstract class KitchenEvent extends Equatable {
  const KitchenEvent();

  @override
  List<Object> get props => [];
}

class ZeroKitchenEvent extends KitchenEvent {
  final List<PartOfKitchen> partsOfKitchenList;

  const ZeroKitchenEvent({required this.partsOfKitchenList});
}

class FirstKitchenEvent extends KitchenEvent {
  final List<PartOfKitchen> partsOfKitchenList;

  const FirstKitchenEvent({required this.partsOfKitchenList});
  @override
  List<Object> get props => [partsOfKitchenList];
}

class SecondKitchenEvent extends KitchenEvent {
  final List<PartOfKitchen> partsOfKitchenList;

  const SecondKitchenEvent(this.partsOfKitchenList);
}
