part of 'kitchen_bloc.dart';

abstract class KitchenState extends Equatable {
  const KitchenState();

  @override
  List<Object> get props => [];
}

class KitchenInitial extends KitchenState {}

class KitchenMain extends KitchenState {
  final List<PartOfKitchen> partsOfKitchenList;
  const KitchenMain(this.partsOfKitchenList);
  @override
  List<Object> get props => [partsOfKitchenList];
}
