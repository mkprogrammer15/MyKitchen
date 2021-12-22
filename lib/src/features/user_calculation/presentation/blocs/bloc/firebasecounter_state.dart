part of 'firebasecounter_bloc.dart';

abstract class FirebasecounterState extends Equatable {
  const FirebasecounterState();

  @override
  List<Object> get props => [];
}

class FirebasecounterInitial extends FirebasecounterState {}

class FirebasePartsCalculatedState extends FirebasecounterState {
  final List<PartOfKitchen> partsOfKitchenList;
  final double kitchenPrice;
  const FirebasePartsCalculatedState(
      this.partsOfKitchenList, this.kitchenPrice);
  @override
  List<Object> get props => [partsOfKitchenList];
}

class FirebaseSumUpState extends FirebasecounterState {
  final List<PartOfKitchen> partsOfKitchenList;
  double? totalKitchenPrice;
  FirebaseSumUpState(
      {required this.partsOfKitchenList, this.totalKitchenPrice});
  @override
  List<Object> get props => [partsOfKitchenList];
}

class DataFirebaseState extends FirebasecounterState {
  final List<PartOfKitchen> partOfKitchenList;
  double? totalKitchenPrice;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userAddress;
  String? userComment;
  String? installationDate;

  DataFirebaseState(
      {required this.partOfKitchenList,
      this.totalKitchenPrice,
      this.installationDate,
      this.userAddress,
      this.userComment,
      this.userEmail,
      this.userName,
      this.userPhone});

  List<Object> get props => [];
}
