import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:profi_neon/src/core/style/background_gradient.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/widgets/back_appbar_button.dart';
import 'package:profi_neon/src/features/admin_orders/data/data_sources/screenshot_maker.dart';
import 'package:profi_neon/src/features/admin_orders/domain/entities/request_entity.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/blocs/bloc/requests_bloc.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/widgets/delete_document_alert_dialog.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/widgets/details_of_request_document.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/widgets/user_contact_details.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:fluttertoast/fluttertoast.dart';

class DocumentDetailsScreen extends StatefulWidget {
  static const routeName = 'document_details_screen';
  //final DocumentSnapshot? snapshot;
  final RequestEntity? re;
  const DocumentDetailsScreen({this.re});
  @override
  _DocumentDetailsScreenState createState() => _DocumentDetailsScreenState();
}

class _DocumentDetailsScreenState extends State<DocumentDetailsScreen> {
  // final _passwortToDeleteDocument = TextEditingController();
  final _adminComment = TextEditingController();
  final screenshotController = ScreenshotController();

  void showToast() => Fluttertoast.showToast(
      backgroundColor: corp,
      msg: 'Image added to Gallery!',
      fontSize: 24,
      gravity: ToastGravity.BOTTOM);

  // make image to pdf
  //make invoice with pdf

  @override
  Widget build(BuildContext context) {
    return Screenshot<Image>(
      controller: screenshotController,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: inkDark,
          centerTitle: true,
          title: Text(
            'Anfrage von ${widget.re!.userName}',
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 18),
          ),
          leading: BackAppBarButton(
            onpress: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  //implementation of invoice maker in pdf
                },
                icon: const Icon(
                  Icons.receipt,
                  color: corp,
                )),
            IconButton(
                onPressed: () async {
                  final image = await screenshotController.capture();
                  if (image == null) return;
                  await ScreenshotMaker.saveImage(image);
                  showToast();
                },
                icon: const Icon(
                  Icons.scanner,
                  color: corp,
                ))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BackGroundGradient(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: UserContactDetailsWidget(
                        widget: widget,
                        widget1: widget,
                        widget2: widget,
                        widget3: widget,
                        widget4: widget,
                        widget5: widget,
                        widget6: widget,
                        widget7: widget),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ink,
                          border: Border.all(width: 2, color: pinkyRed),
                          borderRadius: BorderRadius.circular(30)),
                      child: DetailsOfRequestDocument(
                          widget: widget,
                          widget1: widget,
                          widget2: widget,
                          widget3: widget,
                          widget4: widget,
                          widget5: widget,
                          widget6: widget,
                          widget7: widget,
                          widget8: widget,
                          widget9: widget,
                          widget10: widget),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 450,
                    child: widget.re!.imageUrl.isNotEmpty
                        ? PhotoView(
                            imageProvider:
                                NetworkImage(widget.re!.imageUrl.toString()))
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                        'Administrator Anmerkung: ${widget.re!.adminComment}'),
                  ),
                  Center(
                    child: TextFormField(
                      controller: _adminComment,
                      decoration: const InputDecoration(
                          hintText: 'Administratorkommentar'),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<RequestsBloc>(context).add(
                                UpdateCollectionDocumentEvent(
                                    keyId: widget.re!.documentID,
                                    adminComment: _adminComment.text));
                            Navigator.of(context)
                                .pushNamed('admin_account_screen');
                          },
                          style: ElevatedButton.styleFrom(primary: inkDark),
                          child: Text(
                            'Anmerkung +',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog<void>(
                                  context: context,
                                  builder: (context) {
                                    return DeleteDocumentAlertDialog(
                                        widget: widget);
                                  });
                            },
                            style: ElevatedButton.styleFrom(primary: inkDark),
                            child: Text(
                              'Anfrage löschen',
                              style: Theme.of(context).textTheme.headline4,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
