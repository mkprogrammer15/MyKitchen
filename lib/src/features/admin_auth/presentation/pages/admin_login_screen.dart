import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:profi_neon/src/core/style/background_gradient.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/widgets/admin_appbar.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/widgets/admin_auth_buttons.dart';

class AdminLoginScreen extends StatefulWidget {
  static const routeName = 'admin_screen';
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
        info: 'Adminbereich',
        appIcon: const Icon(null),
      ),
      body: BackGroundGradient(
        child: FormBuilder(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _nameController,
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(color: cherry),
                        labelText: 'Benutzername',
                        labelStyle: TextStyle(color: inkBright),
                        hintText: 'Name',
                        suffixIcon: Icon(
                          Icons.person,
                          color: inkBright,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name benötigt';
                        }
                        return null;
                      }),
                ),
                Container(
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email benötigt';
                        }
                        return null;
                      }),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Passwort benötigt';
                      }
                      return null;
                    },
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
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                AdminAuthButtons(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    nameController: _nameController)
              ],
            )),
      ),
    );
  }
}
