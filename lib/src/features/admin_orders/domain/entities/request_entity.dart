class RequestEntity {
  final String userName;
  final String phone;
  final String address;
  final String clientComment;
  final String kitchenSize;
  final bool herd;
  final bool haenge;
  final bool waschmaschine;
  final bool spuelmaschine;
  final bool platte;
  final bool gebraucht;
  final String documentID;
  final String installationDate;
  final String requestDate;
  final String email;
  final String totalPrice;
  final String adminComment;

  RequestEntity(
      {required this.userName,
      required this.phone,
      required this.address,
      required this.clientComment,
      required this.kitchenSize,
      required this.herd,
      required this.haenge,
      required this.waschmaschine,
      required this.spuelmaschine,
      required this.platte,
      required this.gebraucht,
      required this.documentID,
      required this.installationDate,
      required this.requestDate,
      required this.email,
      required this.totalPrice,
      required this.adminComment});
}
