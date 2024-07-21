import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/data/data_source/remote/internet_checker.dart';
import 'app/data/http/http.dart';
import 'app/inject_repositories.dart';
import 'app/my_app.dart';
import 'app/presentation/global/controllers/theme_control.dart';
import 'app/presentation/modules/home/controller/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final systemDarkMode = window.platformBrightness == Brightness.dark;

  final http = Http(
    baseUrl: 'https://api.thecatapi.com',
    apiKey:
        'ive_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr',
  );

  await injectDependencies(
    preferences: await SharedPreferences.getInstance(),
    systemDarkMode: systemDarkMode,
    connectivity: Connectivity(),
    internetChecker: InternetChecker(),
    http: http,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeController>(
          create: (context) {
            final preferenceRepository = Repositories.preferences;
            return ThemeController(
              preferenceRepository.darkMode,
              preferenceRepository: preferenceRepository,
            );
          },
        ),
        ChangeNotifierProvider<HomeController>(
          create: (context) {
            return HomeController(
              breedsRepository: Repositories.breeds,
            )..init();
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}
