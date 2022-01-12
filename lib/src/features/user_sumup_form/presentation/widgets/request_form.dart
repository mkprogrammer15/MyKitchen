import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/user_calculation/data/models/part_of_kitchen.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/blocs/bloc/firebasecounter_bloc.dart';
import 'package:profi_neon/src/features/user_sumup_form/presentation/widgets/image_picker_widget.dart';
import 'package:profi_neon/src/features/user_sumup_form/presentation/widgets/user_form_inputs.dart';
import 'package:validators/validators.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RequestForm extends StatefulWidget {
  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final GlobalKey _formKey = GlobalKey();

  DateTime currentDate = DateTime.now();
  String dateText = 'Terminwunsch';

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        final formattedDate = DateFormat('dd-MM-yyyy').format(currentDate);
        dateText = formattedDate.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _commentController.clear();
    _addressController.clear();
    _phoneController.clear();
    _nameController.clear();
    _emailController.clear();
  }

  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      } else {
        setState(() {
          final imageTemporary = File(image.path);
          this.image = imageTemporary;
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick the image: $e');
    }
  }

  String imageDownloadUrl = '';
  bool loadingToSendRequest = false;

  Future updloadImageToFirebase(BuildContext context) async {
    if (image == null) {
      return;
    }
    final fileName = basename(image!.path);
    final firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    final uploadTask = firebaseStorageRef.putFile(image!);
    final taskSnapshot = await uploadTask;
    imageDownloadUrl =
        await taskSnapshot.ref.getDownloadURL().then((value) => value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FormBuilder(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(children: [
          UserFormInputs(
              nameController: _nameController,
              emailController: _emailController,
              phoneController: _phoneController,
              addressController: _addressController,
              commentController: _commentController),
          Text(
            dateText == 'Terminwunsch'
                ? AppLocalization.of(context)!.getTranslatedValues(dateText)
                : dateText,
            style: Theme.of(context).textTheme.headline3,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: inkDark),
              onPressed: () => _selectDate(context),
              child: Text(
                AppLocalization.of(context)!
                    .getTranslatedValues('Wählen Sie Ihr Wunschtermin'),
                style: Theme.of(context).textTheme.headline4,
              )),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1,
            color: blueyGrey,
          ),
          ImagePickerWidget(
              image: image,
              pickImageFromCamera: () => pickImage(ImageSource.camera),
              pickImageFromGallery: () => pickImage(ImageSource.gallery)),
          loadingToSendRequest == false
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: inkDark),
                  onPressed: () async {
                    setState(() {
                      loadingToSendRequest = true;
                    });
                    await updloadImageToFirebase(context);
                    BlocProvider.of<FirebaseCounterBloc>(context).add(
                        SecondFirebaseEvent(
                            partsOfKitchenList: PartOfKitchen.getList(),
                            installationDate: dateText,
                            userAddress: _addressController.text,
                            userComment: _commentController.text,
                            userEmail: _emailController.text,
                            userName: _nameController.text,
                            userPhone: _phoneController.text,
                            imageUrl: imageDownloadUrl));

                    await Navigator.of(context)
                        .pushNamed('after_request_screen');
                  },
                  child: Text(
                      AppLocalization.of(context)!
                          .getTranslatedValues('Anfrage abschicken'),
                      style: Theme.of(context).textTheme.headline4),
                )
              : const CircularProgressIndicator(),
        ]),
      ),
    );
  }
}
