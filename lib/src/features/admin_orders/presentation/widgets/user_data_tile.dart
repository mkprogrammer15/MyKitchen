import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/pages/document_details_screen.dart';

class UserDataTile extends StatelessWidget {
  const UserDataTile({
    Key? key,
    required this.snapshot,
    required this.widget,
    required this.icon,
    required this.tileName,
    this.onTap,
  }) : super(key: key);

  final DocumentDetailsScreen widget;
  final String snapshot;
  final Icon icon;
  final String tileName;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: icon,
      tileColor: blueyGrey,
      title: Text(
        '$tileName: ${snapshot}',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
