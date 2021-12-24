import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profi_neon/src/features/admin_orders/domain/entities/request_entity.dart';

class RequestModel extends RequestEntity {
  RequestModel(
      {required String userName,
      required String phone,
      required String address,
      required String clientComment,
      required String kitchenSize,
      required bool herd,
      required bool haenge,
      required bool waschmaschine,
      required bool spuelmaschine,
      required bool platte,
      required bool gebraucht,
      required String documentID,
      required String installationDate,
      required String requestDate,
      required String email,
      required String totalPrice,
      required String adminComment,
      required String imageUrl})
      : super(
            address: address,
            clientComment: clientComment,
            documentID: documentID,
            gebraucht: gebraucht,
            haenge: haenge,
            herd: herd,
            installationDate: installationDate,
            platte: platte,
            spuelmaschine: spuelmaschine,
            userName: userName,
            waschmaschine: waschmaschine,
            phone: phone,
            kitchenSize: kitchenSize,
            requestDate: requestDate,
            email: email,
            totalPrice: totalPrice,
            adminComment: adminComment,
            imageUrl: imageUrl);

  factory RequestModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snap) {
    final requestModel = RequestModel(
        imageUrl: snap.data()['Bild Küche'].toString(),
        userName: snap.data()['Name'].toString(),
        requestDate: snap.data()['Anfrage vom'].toString(),
        address: snap.data()['Address'].toString(),
        clientComment: snap.data()['Comment user'].toString(),
        email: snap.data()['Email'].toString(),
        gebraucht: snap.data()['Gebrauchte Küche'] as bool,
        haenge: snap.data()['Hängeschränke'] as bool,
        herd: snap.data()['Herd'] as bool,
        platte: snap.data()['Arbeitsplatte schneiden'] as bool,
        waschmaschine: snap.data()['Waschmaschine'] as bool,
        spuelmaschine: snap.data()['Spülmaschine'] as bool,
        phone: snap.data()['Phone'].toString(),
        kitchenSize: snap.data()['Küchenlänge'].toString(),
        documentID: snap.data()['Document ID'].toString(),
        installationDate: snap.data()['Installation Date'].toString(),
        totalPrice: snap.data()['Total price'].toString(),
        adminComment: snap.data()['Administrator Anmerkung'].toString());

    return requestModel;
  }
}
