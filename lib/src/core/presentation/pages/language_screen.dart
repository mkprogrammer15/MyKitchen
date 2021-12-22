import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/data/models/languagelist.dart';
import 'package:profi_neon/src/core/presentation/blocs/firebase_user_auth_bloc.dart';
import 'package:profi_neon/src/core/presentation/blocs/first_screen_ui_bloc.dart';
import 'package:profi_neon/src/core/presentation/blocs/language_bloc.dart';
import 'package:profi_neon/src/core/presentation/widgets/icon_button_language.dart';
import 'package:profi_neon/src/core/presentation/widgets/my_drawer.dart';
import 'package:profi_neon/src/core/style/background_gradient.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/pages/client_counter_screen.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FirstScreenUIBloc>(context)
        .add(BorderIconEvent(langList: LanguageList.langList));
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: corp),
          centerTitle: true,
          title: Text(
            'BuildMyKitchen',
            style: Theme.of(context).textTheme.headline1,
          ),
          actions: [
            IconButton(
                color: corp,
                onPressed: () {
                  Navigator.pushNamed(context, 'admin_screen');
                },
                icon: const Icon(Icons.person)),
          ],
        ),
        drawer: MyDrawer(),
        body: BlocBuilder<FirstScreenUIBloc, FirstScreenUIState>(
            builder: (context, state) {
          if (state is BorderIconState) {
            return BackGroundGradient(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalization.of(context)!
                        .getTranslatedValues('Wählen Sie die Sprache'),
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButtonLanguage(
                            iconBorder: state.langList[0] == true
                                ? Border.all(width: 2, color: lime)
                                : null,
                            chooseLanguage: () {
                              LanguageList.changeLanguage(0);
                              BlocProvider.of<LanguageBloc>(context).add(
                                  const LanguageEvent(
                                      locale: Locale('de', 'DE')));
                            },
                            language: 'german',
                            imagepath: 'assets/images/grmnflg.png'),
                        const SizedBox(width: 20),
                        IconButtonLanguage(
                          iconBorder: state.langList[1] == true
                              ? Border.all(width: 2, color: lime)
                              : null,
                          chooseLanguage: () {
                            LanguageList.changeLanguage(1);

                            BlocProvider.of<LanguageBloc>(context).add(
                                const LanguageEvent(
                                    locale: Locale('en', 'EN')));
                          },
                          language: 'english',
                          imagepath: 'assets/images/uk.png',
                        ),
                        const SizedBox(width: 20),
                        IconButtonLanguage(
                          iconBorder: state.langList[2] == true
                              ? Border.all(width: 2, color: lime)
                              : null,
                          chooseLanguage: () {
                            LanguageList.changeLanguage(2);
                            BlocProvider.of<LanguageBloc>(context).add(
                                const LanguageEvent(
                                    locale: Locale('ru', 'RU')));
                          },
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
                      child: state.langList.any((element) => element == true)
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: inkDark),
                              onPressed: () {
                                BlocProvider.of<FirebaseUserAuthBloc>(context)
                                    .add(UserSigninAnonEvent());
                                // Navigator.pushNamed(
                                //     context, 'client_counter_screen');
                                Navigator.push<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                        builder: (context) =>
                                            ClientCounterScreen()));
                              },
                              child: Text(
                                'Go',
                                style: Theme.of(context).textTheme.headline4,
                              ))
                          : null)
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        }));
  }
}
