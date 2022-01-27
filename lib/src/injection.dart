import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_neon/src/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String environment) =>
    $initGetIt(getIt, environment: environment);

// void setupGetit() {
//   getIt.registerLazySingleton<RequestRepository>(
//       () => RequestRepositoryImpl(requestDataSource: RequestDataSource()));
// }
