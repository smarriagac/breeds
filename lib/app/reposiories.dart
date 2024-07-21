import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/data_source/remote/breeds_api.dart';
import 'data/data_source/remote/internet_checker.dart';
import 'data/http/http.dart';
import 'data/repositories_impl/breeds_repository_impl.dart';
import 'data/repositories_impl/connectivity_repository_impl.dart';
import 'data/repositories_impl/preference_repository_impl.dart';
import 'domain/repositories/breeds_repository.dart';
import 'domain/repositories/connectivity_repository.dart';
import 'domain/repositories/preferences_repository.dart';

late SharedPreferences sharedPref;
Future<void> injectDependencies() async {
  sharedPref = await SharedPreferences.getInstance();
}

class Repositories {
  Repositories._();

  /// [breeds] : Api para el consumo.
  static final breeds = Provider<BreedsRepository>(
    (ref) => BreedsRepositoryImpl(
      BreedsAPI(
        Http(
          baseUrl: 'https://api.thecatapi.com',
          apiKey:
              'ive_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr',
        ),
      ),
    ),
  );

  /// [connectivity] : ver el estado de la conexion a internet.
  static final connectivity = Provider<ConnectivityRepository>(
    (ref) => ConnectivityRepositoryImpl(
      connectivity: Connectivity(),
      internetChecker: InternetChecker(),
    ),
  );

  /// [preferences] : control de thema flutter.
  static final preferences = Provider<PreferenceRepository>(
    (ref) => PreferenceRepositoryImpl(
      preferences: sharedPref,
      systemDarlMode: window.platformBrightness == Brightness.dark,
    ),
  );
}
