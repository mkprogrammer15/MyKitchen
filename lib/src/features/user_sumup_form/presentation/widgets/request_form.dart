import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/user_calculation/data/models/part_of_kitchen.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/blocs/bloc/firebasecounter_bloc.dart';
import 'package:validators/validators.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FormBuilder(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(children: [
          Text(
            AppLocalization.of(context)!
                .getTranslatedValues('Wie können wir Sie erreichen?'),
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(fontSize: 20, color: corpDarker),
          ),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
                hintText:
                    AppLocalization.of(context)!.getTranslatedValues('Name'),
                labelText: AppLocalization.of(context)!
                    .getTranslatedValues('Ihr Name'),
                suffixIcon: const Icon(Icons.person)),
          ),
          TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.mail),
                hintText: 'email@example.com',
                labelText: AppLocalization.of(context)!
                    .getTranslatedValues('Ihre Email'),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (dynamic value) =>
                  !isEmail(value! as String) ? 'Invalid Email' : null),
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: _phoneController,
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.phone),
                hintText: AppLocalization.of(context)!
                    .getTranslatedValues('Telefonnummer'),
                labelText: AppLocalization.of(context)!
                    .getTranslatedValues('Ihre Telefonnummer')),
          ),
          TextFormField(
            controller: _addressController,
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.home),
                hintText: AppLocalization.of(context)!
                    .getTranslatedValues('Anschrift'),
                labelText: AppLocalization.of(context)!
                    .getTranslatedValues('Ihre Adresse')),
          ),
          TextFormField(
            maxLines: 3,
            maxLength: 200,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.comment),
              hintText:
                  AppLocalization.of(context)!.getTranslatedValues('Kommentar'),
              labelText: AppLocalization.of(context)!
                  .getTranslatedValues('Ihr Kommentar'),
            ),
            controller: _commentController,
          ),
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: inkDark),
            onPressed: () {
              BlocProvider.of<FirebaseCounterBloc>(context).add(
                  SecondFirebaseEvent(
                      partsOfKitchenList: PartOfKitchen.getList(),
                      installationDate: dateText,
                      userAddress: _addressController.text,
                      userComment: _commentController.text,
                      userEmail: _emailController.text,
                      userName: _nameController.text,
                      userPhone: _phoneController.text));

              Navigator.of(context).pushNamed('after_request_screen');
            },
            child: Text(
                AppLocalization.of(context)!
                    .getTranslatedValues('Anfrage abschicken'),
                style: Theme.of(context).textTheme.headline4),
          ),
        ]),
      ),
    );
  }
}
