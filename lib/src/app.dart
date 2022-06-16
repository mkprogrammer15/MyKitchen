// ignore: always_use_package_imports
import 'package:profi_neon/src/core/presentation/pages/check_auth_screen.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/blocs/sign_in_bloc.dart';
import 'package:profi_neon/src/features/user_post_request/presentation/user_post_request_screen.dart';

// ignore: always_use_package_imports
import 'export.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(create: (context) => LanguageBloc(LanguageState.initial())),
        BlocProvider<FirebaseUserAuthBloc>(create: (context) => FirebaseUserAuthBloc()),
        BlocProvider<ChooseLanguageBloc>(create: (context) => ChooseLanguageBloc()),
        BlocProvider<KitchenBloc>(create: (context) => KitchenBloc()),
        BlocProvider<FirebaseCounterBloc>(create: (context) => FirebaseCounterBloc()),
        BlocProvider<SignInBloc>(create: (context) => getIt<SignInBloc>()),
        BlocProvider<RequestsBloc>(create: (context) => RequestsBloc(requestRepository: getIt.get<RequestRepository>())),
        BlocProvider<AdminChatBloc>(create: (context) => AdminChatBloc()),
        BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested())),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            localizationsDelegates: [AppLocalization.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
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
              '/': (context) => CheckAuthScreen(),
              LanguageScreen.routeName: (context) => LanguageScreen(),
              ClientCounterScreen.routeName: (context) => ClientCounterScreen(),
              ClientFormScreen.routeName: (context) => ClientFormScreen(),
              UserPostRequest.routeName: (context) => UserPostRequest(),
              AdminLoginScreen.routeName: (context) => AdminLoginScreen(),
              AdminAccountScreen.routeName: (context) => AdminAccountScreen(),
              DocumentDetailsScreen.routeName: (context) => const DocumentDetailsScreen(),
              AdminAfterRegistrationScreen.routeName: (context) => AdminAfterRegistrationScreen(),
              AdminChatScreen.nameRoute: (context) => AdminChatScreen(),
              // CheckAuthScreen.routeName: (context) => CheckAuthScreen()
            },
          );
        },
      ),
    );
  }
}
