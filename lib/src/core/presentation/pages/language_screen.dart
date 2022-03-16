import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/data/models/languagelist.dart';
import 'package:profi_neon/src/core/presentation/blocs/firebase_user_auth_bloc.dart';
import 'package:profi_neon/src/core/presentation/blocs/choose_language_bloc.dart';
import 'package:profi_neon/src/core/presentation/blocs/language_bloc.dart';
import 'package:profi_neon/src/core/presentation/widgets/icon_button_language.dart';
import 'package:profi_neon/src/core/presentation/widgets/my_drawer.dart';
import 'package:profi_neon/src/core/style/background_gradient.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/pages/client_counter_screen.dart';

class LanguageScreen extends StatelessWidget {
  static const routeName = 'language_screen';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChooseLanguageBloc>(context).add(BorderIconEvent(langList: LanguageList.langList));
    return Scaffold(
        appBar: AppBar(
            backgroundColor: inkDark,
            iconTheme: const IconThemeData(color: corp),
            centerTitle: true,
            title: Text(
              'BuildMyKitchen',
              style: Theme.of(context).textTheme.headline1,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('admin_login_screen');
                  },
                  icon: const Icon(Icons.person)),
            ]),
        drawer: MyDrawer(),
        body: BackGroundGradient(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalization.of(context)!.getTranslatedValues('Wählen Sie die Sprache'),
                style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const IconButtonLanguage(
                      index: 0,
                      currentLanguageSmall: 'de',
                      currentLanguageBig: 'DE',
                      language: 'german',
                      imagepath: 'assets/images/grmnflg.png',
                    ),
                    const SizedBox(width: 20),
                    const IconButtonLanguage(
                      index: 1,
                      currentLanguageSmall: 'en',
                      currentLanguageBig: 'EN',
                      language: 'english',
                      imagepath: 'assets/images/uk.png',
                    ),
                    const SizedBox(width: 20),
                    const IconButtonLanguage(
                      index: 2,
                      currentLanguageSmall: 'ru',
                      currentLanguageBig: 'RU',
                      language: 'russian',
                      imagepath: 'assets/images/rusflg.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  child: LanguageList.langList.any((element) => element == true)
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: inkDark),
                          onPressed: () {
                            BlocProvider.of<FirebaseUserAuthBloc>(context).add(UserSigninAnonEvent());
                            // Navigator.pushNamed(
                            //     context, 'client_counter_screen');
                            Navigator.push<dynamic>(context, MaterialPageRoute<dynamic>(builder: (context) => ClientCounterScreen()));
                          },
                          child: Text(
                            'Go',
                            style: Theme.of(context).textTheme.headline4,
                          ))
                      : null)
            ],
          ),
        ));
  }
}
