import 'package:flutter/material.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:validators/validators.dart';

class UserFormInputs extends StatelessWidget {
  const UserFormInputs({
    Key? key,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController addressController,
    required TextEditingController commentController,
  })  : _nameController = nameController,
        _emailController = emailController,
        _phoneController = phoneController,
        _addressController = addressController,
        _commentController = commentController,
        super(key: key);

  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _phoneController;
  final TextEditingController _addressController;
  final TextEditingController _commentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              labelText:
                  AppLocalization.of(context)!.getTranslatedValues('Ihr Name'),
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
              hintText:
                  AppLocalization.of(context)!.getTranslatedValues('Anschrift'),
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
      ],
    );
  }
}
