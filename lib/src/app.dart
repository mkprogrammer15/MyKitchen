import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/presentation/blocs/firebase_user_auth_bloc.dart';
import 'package:profi_neon/src/core/presentation/blocs/first_screen_ui_bloc.dart';
import 'package:profi_neon/src/core/presentation/blocs/language_bloc.dart';
import 'package:profi_neon/src/core/presentation/pages/language_screen.dart';
import 'package:profi_neon/src/core/style/theme_data.dart';
import 'package:profi_neon/src/features/admin_auth/domain/repositories/auth_repository.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/blocs/bloc/firebase_auth_bloc.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/pages/admin_after_registration_screen.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/pages/admin_login_screen.dart';
import 'package:profi_neon/src/features/admin_chat/presentation/blocs/bloc/admin_chat_bloc.dart';
import 'package:profi_neon/src/features/admin_chat/presentation/pages/admin_chat_screen.dart';
import 'package:profi_neon/src/features/admin_orders/data/repositories/request_repository_impl.dart';
import 'package:profi_neon/src/features/admin_orders/domain/repositories/request_repository.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/blocs/bloc/requests_bloc.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/pages/admin_account_screen.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/pages/document_details_screen.dart';
import 'package:profi_neon/src/features/user_after_request/presentation/after_request_screen.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/blocs/bloc/firebasecounter_bloc.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/blocs/bloc/kitchen_bloc.dart';
import 'package:profi_neon/src/features/user_calculation/presentation/pages/client_counter_screen.dart';
import 'package:profi_neon/src/features/user_sumup_form/presentation/pages/client_form_screen.dart';
import 'package:profi_neon/src/injection.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
            create: (context) => LanguageBloc(LanguageState.initial())),
        BlocProvider<FirebaseUserAuthBloc>(
            create: (context) => FirebaseUserAuthBloc()),
        BlocProvider<FirstScreenUIBloc>(
            create: (context) => FirstScreenUIBloc()),
        BlocProvider<KitchenBloc>(create: (context) => KitchenBloc()),
        BlocProvider<FirebaseCounterBloc>(
            create: (context) => FirebaseCounterBloc()),
        BlocProvider<FirebaseAuthBloc>(
            create: (context) =>
                FirebaseAuthBloc(authRepository: getIt.get<AuthRepository>())),
        BlocProvider<RequestsBloc>(
            create: (context) => RequestsBloc(
                requestRepository: getIt.get<RequestRepository>())),
        BlocProvider<AdminChatBloc>(create: (context) => AdminChatBloc()),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            localizationsDelegates: [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ru', 'RU'),
              Locale('de', 'DE'),
            ],
            debugShowCheckedModeBanner: false,
            theme: themeData,
            title: 'BuildMyKitchen',
            initialRoute: '/',
            routes: {
              '/': (context) => LanguageScreen(),
              ClientCounterScreen.routeName: (context) => ClientCounterScreen(),
              ClientFormScreen.routeName: (context) => ClientFormScreen(),
              AfterRequestScreen.routeName: (context) => AfterRequestScreen(),
              AdminLoginScreen.routeName: (context) => AdminLoginScreen(),
              AdminAccountScreen.routeName: (context) => AdminAccountScreen(),
              DocumentDetailsScreen.routeName: (context) =>
                  const DocumentDetailsScreen(),
              AdminAfterRegistrationScreen.routeName: (context) =>
                  AdminAfterRegistrationScreen(),
              AdminChatScreen.nameRoute: (context) => AdminChatScreen(),
            },
          );
        },
      ),
    );
  }
}
