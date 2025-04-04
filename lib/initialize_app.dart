import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trendy_threads/app.dart';
import 'package:trendy_threads/features/login/auth/repository/authentication_repo.dart';
import 'package:trendy_threads/firebase_options.dart';

Future<void> initializeApp() async {

  //Todo : Add Widgets Binding
  final binding = WidgetsFlutterBinding.ensureInitialized();

  //Todo : Init Local Storage
  await GetStorage.init();


  //Todo : Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: binding);


  //Todo : Initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepo()));

  //Todo : Initialize Authentication
  runApp(const App());
}
