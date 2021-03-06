import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/user_calculation/data/models/part_of_kitchen.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/blocs/bloc/firebasecounter_bloc.dart';
import 'package:profi_neon/src/features/user_sumup_form/image_data_service/image_data_service.dart';
import 'package:profi_neon/src/features/user_sumup_form/presentation/widgets/image_picker_widget.dart';
import 'package:profi_neon/src/features/user_sumup_form/presentation/widgets/user_form_inputs.dart';

class RequestForm extends StatefulWidget {
  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> with ImageDataService {
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

  bool loadingToSendRequest = false;
  bool isWidgetVisible = false;

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
                    .getTranslatedValues('W??hlen Sie Ihr Wunschtermin'),
                style: Theme.of(context).textTheme.headline4,
              )),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1,
            color: blueyGrey,
          ),
          IconButton(
              onPressed: () => setState(() {
                    isWidgetVisible = !isWidgetVisible;
                  }),
              icon: const Icon(
                Icons.camera_alt_rounded,
                size: 30,
                color: corpDarker,
              )),
          Visibility(
            visible: isWidgetVisible,
            child: ImagePickerWidget(
                image: thisImage,
                pickImageFromCamera: () => pickImage(ImageSource.camera),
                pickImageFromGallery: () => pickImage(ImageSource.gallery)),
          ),
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
