import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:profi_neon/src/core/style/background_gradient.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/blocs/sign_in_bloc.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/widgets/admin_appbar.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/widgets/admin_auth_buttons.dart';

class AdminLoginScreen extends StatefulWidget {
  static const routeName = 'admin_login_screen';
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final GlobalKey _formkey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    _nameController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AdminAppBar(
          onpress: () =>
              Navigator.pushReplacementNamed(context, 'language_screen'),
          info: 'Adminbereich',
          appIcon: const Icon(null),
        ),
        body: BackGroundGradient(
            child: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            state.authFailureOrSuccessOption.fold(
                () {},
                (either) => either.fold((failure) {
                      //Make Snackbar to inform user that something went wrong with login
                      FlushbarHelper.createError(
                        message: failure.map(
                            cancelledByUser: (_) => 'Cancelled',
                            serverError: (_) => 'Server Error',
                            emailAlreadyInUse: (_) => 'Email already in use',
                            invalidEmailAndPasswordCombination: (_) =>
                                'Invalid email and password combination'),
                      ).show(context);
                    }, (_) {
                      Navigator.pushNamed(context, 'admin_account_screen');
                    }));
          },
          builder: (context, state) {
            return FormBuilder(
                key: _formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: const InputDecoration(
                            // errorText:
                            errorStyle: TextStyle(color: cherry),
                            labelText: 'Benutzeremail',
                            labelStyle: TextStyle(color: inkBright),
                            hintText: 'Email',
                            suffixIcon: Icon(
                              Icons.email,
                              color: inkBright,
                            ),
                          ),
                          onChanged: (value) => context
                              .read<SignInBloc>()
                              .add(SignInEvent.emailChanged(value)),
                          validator: (_) => context
                              .read<SignInBloc>()
                              .state
                              .emailAddress
                              .value
                              .fold(
                                  (f) => f.maybeMap(
                                      invalidEmail: (_) => 'Invalid Email',
                                      orElse: () => null),
                                  (_) => null)),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                          controller: _passwordController,
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                              errorStyle: const TextStyle(color: cherry),
                              labelText: 'Passwort',
                              labelStyle: const TextStyle(color: inkBright),
                              hintText: 'Passwort',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                icon: const Icon(Icons.remove_red_eye),
                                color: inkBright,
                              )),
                          onChanged: (value) => context
                              .read<SignInBloc>()
                              .add(SignInEvent.passwordChanged(value)),
                          validator: (_) => context
                              .read<SignInBloc>()
                              .state
                              .password
                              .value
                              .fold(
                                  (f) => f.maybeMap(
                                      shortPassword: (_) => 'Short password',
                                      orElse: () => null),
                                  (_) => null)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AdminAuthButtons(
                      emailController: _emailController,
                      passwordController: _passwordController,
                    )
                  ],
                ));
          },
        )));
  }
}
