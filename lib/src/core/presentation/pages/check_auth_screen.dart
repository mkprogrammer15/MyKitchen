import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/core/style/background_gradient.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/blocs/auth/auth_bloc.dart';

class CheckAuthScreen extends StatefulWidget {
  static const routeName = 'check_auth_screen';
  @override
  _CheckAuthScreenState createState() => _CheckAuthScreenState();
}

class _CheckAuthScreenState extends State<CheckAuthScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context)
        .add(const AuthEvent.authCheckRequested());
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
            initial: (_) {},
            authenticated: (_) =>
                Navigator.pushNamed(context, 'admin_account_screen'),
            unauthenticated: (_) =>
                Navigator.pushNamed(context, 'admin_login_screen'));
      },
      child: Scaffold(
        body: BackGroundGradient(
          child: Center(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      setState(() {});
                      Navigator.pushNamed(context, 'admin_login_screen');
                    },
                    child: const Text('Refresh page'));
              },
            ),
          ),
        ),
      ),
    );
  }
}
