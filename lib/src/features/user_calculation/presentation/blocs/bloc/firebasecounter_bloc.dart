import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:profi_neon/src/features/user_calculation/data/models/part_of_kitchen.dart';
import 'package:intl/intl.dart';

part 'firebasecounter_event.dart';
part 'firebasecounter_state.dart';

class FirebaseCounterBloc extends Bloc<FirebasecounterEvent, FirebasecounterState> {
  FirebaseCounterBloc() : super(FirebasecounterInitial());

  List<PartOfKitchen>? partsOfKitchenList;
  double? totalKitchenPrice;
  double? lengthPrice;
  double? kitchenSize;
  List? documentList;

  @override
  Stream<FirebasecounterState> mapEventToState(
    FirebasecounterEvent event,
  ) async* {
    if (event is ZeroFirebaseEvent) {
      partsOfKitchenList = event.partsOfKitchenList;
      yield FirebaseSumUpState(partsOfKitchenList: partsOfKitchenList!, totalKitchenPrice: totalKitchenPrice);
    }

    if (event is FirstFirebaseEvent) {
      partsOfKitchenList = event.partsOfKitchenList;
      double calculateTotalPartsPrice() {
        double totalPrice = 0;
        for (var i = 0; i < partsOfKitchenList!.length; i++) {
          if (partsOfKitchenList![i].isActive == true) {
            totalPrice += partsOfKitchenList![i].price;
          }
        }
        return totalPrice;
      }

      final kitchenSizeFromEvent = event.kitchenSize;
      kitchenSize = kitchenSizeFromEvent;
      lengthPrice = kitchenSizeFromEvent * 180;
      final partsPrice = calculateTotalPartsPrice();
      totalKitchenPrice = partsPrice + lengthPrice!;

      final newList = event.partsOfKitchenList;
      yield FirebasePartsCalculatedState(newList, totalKitchenPrice!);
    }

    if (event is SecondFirebaseEvent) {
      partsOfKitchenList = PartOfKitchen.getList();
      final _partNamesAndStatus = <String, dynamic>{};
      final _totalData = <String, dynamic>{};

      partsOfKitchenList!.forEach((element) => _partNamesAndStatus[element.partName] = element.isActive);

      final _userName = event.userName;
      final _installationDate = event.installationDate;
      final _userPhone = event.userPhone;
      final _userComment = event.userComment;
      final _userEmail = event.userEmail;
      final _userAddress = event.userAddress;
      final _imageUrl = event.imageUrl;

      final currentDate = DateTime.now();
      final formattedDate = DateFormat('dd-MM-yyyy kk:mm:ss').format(currentDate).toString();

      final DocumentReference documentReference = await FirebaseFirestore.instance.collection('Requests').add(<String, String>{'DocID': ''});

      final _docId = documentReference.id;

      final data = <String, dynamic>{
        'Anfrage vom': formattedDate,
        'Document ID': _docId,
        'Name': _userName,
        'Email': _userEmail,
        'Phone': _userPhone,
        'Address': _userAddress,
        'Comment user': _userComment,
        'Installation Date': _installationDate,
        'Küchenlänge': '$kitchenSize',
        'Bild Küche': '$_imageUrl',
        'Total price': '$totalKitchenPrice €',
        'Administrator Anmerkung': ''
      };

      _totalData
        ..addAll(data)
        ..addAll(_partNamesAndStatus);

      await FirebaseFirestore.instance.collection('Requests').doc(_docId).set(_totalData);

      yield DataFirebaseState(
          partOfKitchenList: partsOfKitchenList!,
          totalKitchenPrice: totalKitchenPrice,
          userName: _userName,
          installationDate: _installationDate,
          userAddress: _userAddress,
          userComment: _userComment,
          userEmail: _userEmail,
          userPhone: _userPhone,
          imageUrl: _imageUrl);
    }
  }
}
