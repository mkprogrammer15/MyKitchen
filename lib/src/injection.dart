import 'package:get_it/get_it.dart';
import 'package:profi_neon/src/features/admin_auth/data/data_sources/auth_data_source.dart';
import 'package:profi_neon/src/features/admin_auth/data/repositories/auth_repository_impl.dart';
import 'package:profi_neon/src/features/admin_auth/domain/repositories/auth_repository.dart';
import 'package:profi_neon/src/features/admin_orders/data/data_sources/request_data_source.dart';
import 'package:profi_neon/src/features/admin_orders/data/repositories/request_repository_impl.dart';
import 'package:profi_neon/src/features/admin_orders/domain/repositories/request_repository.dart';

final getIt = GetIt.instance;

// @injectableInit
// void configureInjection(String environment) =>
//     $initGetIt(getIt, environment: environment);

void setupGetit() {
  getIt.registerLazySingleton<RequestRepository>(
      () => RequestRepositoryImpl(requestDataSource: RequestDataSource()));

  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: AuthDataSource()));
}

// abstract class Env {
//   static const dev = 'dev';
//   static const prod = 'prod';
// }
