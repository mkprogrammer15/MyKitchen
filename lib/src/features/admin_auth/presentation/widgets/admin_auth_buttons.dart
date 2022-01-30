import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/export.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/blocs/sign_in_bloc.dart';

class AdminAuthButtons extends StatelessWidget {
  const AdminAuthButtons({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<SignInBloc>(context)
                  .add(const SignInEvent.signInWithEmailAndPasswordPressed());
            },
            style: ElevatedButton.styleFrom(primary: inkDark),
            child: Text('Einloggen',
                style: Theme.of(context).textTheme.headline4)),
        const SizedBox(
          width: 30,
        ),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<SignInBloc>(context)
                  .add(const SignInEvent.registerWithEmailAndPasswordPressed());
            },
            style: ElevatedButton.styleFrom(primary: inkDark),
            child: Text('Registrieren',
                style: Theme.of(context).textTheme.headline4)),
      ],
    );
  }
}
