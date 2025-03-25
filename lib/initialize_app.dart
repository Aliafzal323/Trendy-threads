import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trendy_threads/app.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await CacheStorage.initialize();
  // CachedBloc.initialize();

  // await Firebase.initializeApp();

  // await AssetImages.preloadLogoBackground();
  // await config();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App());
}
