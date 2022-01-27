// ignore: always_use_package_imports
import 'package:profi_neon/src/features/admin_auth/presentation/blocs/sign_in_bloc.dart';

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
        BlocProvider<LanguageBloc>(
            create: (context) => LanguageBloc(LanguageState.initial())),
        BlocProvider<FirebaseUserAuthBloc>(
            create: (context) => FirebaseUserAuthBloc()),
        BlocProvider<FirstScreenUIBloc>(
            create: (context) => FirstScreenUIBloc()),
        BlocProvider<KitchenBloc>(create: (context) => KitchenBloc()),
        BlocProvider<FirebaseCounterBloc>(
            create: (context) => FirebaseCounterBloc()),
        BlocProvider<SignInBloc>(create: (context) => getIt<SignInBloc>()),
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
