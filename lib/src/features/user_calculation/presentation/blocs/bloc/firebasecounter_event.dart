part of 'firebasecounter_bloc.dart';

abstract class FirebasecounterEvent extends Equatable {
  const FirebasecounterEvent();

  @override
  List<Object> get props => [];
}

class ZeroFirebaseEvent extends FirebasecounterEvent {
  final List<PartOfKitchen> partsOfKitchenList;
  final double? totalKitchenPrice;
  ZeroFirebaseEvent({required this.partsOfKitchenList, this.totalKitchenPrice});

  @override
  List<Object> get props => [];
}

class FirstFirebaseEvent extends FirebasecounterEvent {
  final List<PartOfKitchen> partsOfKitchenList;
  final double kitchenSize;
  FirstFirebaseEvent(
      {required this.partsOfKitchenList, required this.kitchenSize});

  @override
  List<Object> get props => [];
}

class SecondFirebaseEvent extends FirebasecounterEvent {
  final List<PartOfKitchen> partsOfKitchenList;
  final double? totalKitchenPrice;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userAddress;
  String? userComment;
  String? installationDate;

  SecondFirebaseEvent(
      {required this.partsOfKitchenList,
      this.totalKitchenPrice,
      this.installationDate,
      this.userAddress,
      this.userComment,
      this.userEmail,
      this.userName,
      this.userPhone});

  @override
  List<Object> get props => [];
}
