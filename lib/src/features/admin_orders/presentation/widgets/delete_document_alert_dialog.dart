import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/blocs/bloc/requests_bloc.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/pages/document_details_screen.dart';

class DeleteDocumentAlertDialog extends StatelessWidget {
  const DeleteDocumentAlertDialog({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DocumentDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Möchten Sie diese Anfrage endgültig löschen?'),
      actions: [
        TextButton(
            onPressed: () {
              BlocProvider.of<RequestsBloc>(context).add(
                  DeleteCollectionDocumentEvent(keyId: widget.re!.documentID));
              Navigator.of(context).pushNamed('admin_account_screen');
            },
            child: const Text('Ja')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Nein'))
      ],
    );
  }
}
