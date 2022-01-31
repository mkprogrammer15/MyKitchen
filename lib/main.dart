import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_neon/src/app.dart';
import 'package:profi_neon/src/injection.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await Firebase.initializeApp();
  // ignore: unawaited_futures
  // setupGetit();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(App());
}
