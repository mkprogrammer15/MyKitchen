import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/blocs/bloc/firebase_auth_bloc.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/pages/admin_login_screen.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/widgets/back_appbar_button.dart';

class AdminAppBar extends StatelessWidget with PreferredSizeWidget {
  AdminAppBar({
    Key? key,
    required this.info,
    required this.appIcon,
  }) : super(key: key);

  String info;
  Icon appIcon;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: const BackAppBarButton(),
        centerTitle: true,
        title: Text(
          info,
          style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<FirebaseAuthBloc>(context).add(SignOutEvent());
              Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
                  builder: (context) => AdminLoginScreen()));
            },
            icon: appIcon,
            color: corp,
          )
        ]);
  }
}
