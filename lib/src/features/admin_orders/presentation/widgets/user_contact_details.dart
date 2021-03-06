import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/contact_details.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/pages/document_details_screen.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/widgets/user_data_tile.dart';
import 'package:url_launcher/url_launcher.dart';

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
        GestureDetector(
          onTap: () => ContactDetails.launchEmail(widget.re!.email),
          child: UserDataTile(
            tileName: 'Email',
            widget: widget,
            snapshot: widget.re!.email,
            icon: const Icon(
              Icons.email,
              color: corp,
            ),
          ),
        ),
        const Divider(),
        GestureDetector(
          onTap: () => ContactDetails.launchPhone(widget.re!.phone),
          child: UserDataTile(
            tileName: 'Telefon',
            snapshot: widget.re!.phone,
            widget: widget,
            icon: const Icon(
              Icons.phone,
              color: apple,
            ),
          ),
        ),
        const Divider(),
        GestureDetector(
          onTap: () => ContactDetails.launchMap(widget.re!.address),
          child: UserDataTile(
              snapshot: widget.re!.address,
              widget: widget,
              icon: const Icon(
                Icons.home,
                color: lime,
              ),
              tileName: 'Kundenanschrift'),
        ),
        const Divider(),
        UserDataTile(
            snapshot: widget.re!.clientComment,
            widget: widget,
            icon: const Icon(
              Icons.comment,
              color: pale,
            ),
            tileName: 'Kommentar Kunde')
      ],
    );
  }
}
