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
      required String adminComment})
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
            adminComment: adminComment);

  factory RequestModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snap) {
    final requestModel = RequestModel(
        userName: snap['Name'].toString(),
        requestDate: snap['Anfrage vom'].toString(),
        address: snap['Address'].toString(),
        clientComment: snap['Comment user'].toString(),
        email: snap['Email'].toString(),
        gebraucht: snap['Gebrauchte Küche'] as bool,
        haenge: snap['Hängeschränke'] as bool,
        herd: snap['Herd'] as bool,
        platte: snap['Arbeitsplatte schneiden'] as bool,
        waschmaschine: snap['Waschmaschine'] as bool,
        spuelmaschine: snap['Spülmaschine'] as bool,
        phone: snap['Phone'].toString(),
        kitchenSize: snap['Küchenlänge'].toString(),
        documentID: snap['Document ID'].toString(),
        installationDate: snap['Installation Date'].toString(),
        totalPrice: snap['Total price'].toString(),
        adminComment: snap['Administrator Anmerkung'].toString());

    return requestModel;
  }
}
