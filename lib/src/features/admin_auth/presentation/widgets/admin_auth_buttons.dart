import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/blocs/bloc/firebase_auth_bloc.dart';

class AdminAuthButtons extends StatelessWidget {
  const AdminAuthButtons({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    // required TextEditingController nameController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        //   _nameController = nameController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
//  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              if (_emailController.text.isNotEmpty &&
                  _passwordController.text.isNotEmpty) {
                BlocProvider.of<FirebaseAuthBloc>(context).add(
                  SignInEvent(
                      email: _emailController.text,
                      password: _passwordController.text),
                );
                Navigator.of(context).pushNamed('admin_account_screen');
              }
            },
            style: ElevatedButton.styleFrom(primary: inkDark),
            child: Text('Einloggen',
                style: Theme.of(context).textTheme.headline4)),
        const SizedBox(
          width: 30,
        ),
        ElevatedButton(
            onPressed: () {
              if (_emailController.text.isNotEmpty &&
                  _passwordController.text.isNotEmpty) {
                BlocProvider.of<FirebaseAuthBloc>(context).add(RegisterEvent(
                    email: _emailController.text,
                    password: _passwordController.text,
                    name: _emailController.text));
                Navigator.of(context)
                    .pushNamed('admin_after_registration_screen');
              }
            },
            style: ElevatedButton.styleFrom(primary: inkDark),
            child: Text('Registrieren',
                style: Theme.of(context).textTheme.headline4)),
      ],
    );
  }
}
