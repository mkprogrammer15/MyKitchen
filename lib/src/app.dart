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
