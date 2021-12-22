import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/pages/document_details_screen.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/widgets/user_data_tile.dart';

class UserContactDetailsWidget extends StatelessWidget {
  const UserContactDetailsWidget({
    Key? key,
    required this.widget,
    required this.widget1,
    required this.widget2,
    required this.widget3,
    required this.widget4,
    required this.widget5,
    required this.widget6,
    required this.widget7,
  }) : super(key: key);

  final DocumentDetailsScreen widget;
  final DocumentDetailsScreen widget1;
  final DocumentDetailsScreen widget2;
  final DocumentDetailsScreen widget3;
  final DocumentDetailsScreen widget4;
  final DocumentDetailsScreen widget5;
  final DocumentDetailsScreen widget6;
  final DocumentDetailsScreen widget7;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserDataTile(
          tileName: 'Email',
          widget: widget,
          snapshot: '${widget.re!.email}',
          icon: Icon(
            Icons.email,
            color: corp,
          ),
        ),
        const Divider(),
        UserDataTile(
          tileName: 'Telefon',
          snapshot: '${widget.re!.phone}',
          widget: widget,
          icon: Icon(
            Icons.phone,
            color: apple,
          ),
        ),
        const Divider(),
        UserDataTile(
            snapshot: '${widget.re!.address}',
            widget: widget,
            icon: Icon(
              Icons.home,
              color: lime,
            ),
            tileName: 'Kundenanschrift'),
        const Divider(),
        UserDataTile(
            snapshot: '${widget.re!.clientComment}',
            widget: widget,
            icon: Icon(
              Icons.comment,
              color: pale,
            ),
            tileName: 'Kommentar Kunde')
      ],
    );
  }
}
