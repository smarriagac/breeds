import 'package:connectivity_plus/connectivity_plus.dart';
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
import 'presentation/global/service_locator/service_locator.dart';

Future<void> injectDependencies({
  required bool systemDarkMode,
  required SharedPreferences preferences,
  required Connectivity connectivity,
  required InternetChecker internetChecker,
  required Http http,
}) async {
  ServiceLocator.instance.put<PreferenceRepository>(
    PreferenceRepositoryImpl(
      preferences: preferences,
      systemDarlMode: systemDarkMode,
    ),
  );

  final connectivityRepository =
      ServiceLocator.instance.put<ConnectivityRepository>(
    ConnectivityRepositoryImpl(
      connectivity: connectivity,
      internetChecker: internetChecker,
    ),
  );

  ServiceLocator.instance.put<BreedsRepository>(
    BreedsRepositoryImpl(
      BreedsAPI(http),
    ),
  );

  await connectivityRepository.initialize();
}

class Repositories {
  Repositories._(); // coverage:ignore-line

  /// [breeds] : Api para el consumo.
  static BreedsRepository get breeds => ServiceLocator.instance.find();

  /// [connectivity] : ver el estado de la conexion a internet.
  static ConnectivityRepository get connectivity =>
      ServiceLocator.instance.find();

  /// [preferences] : control de thema flutter.
  static PreferenceRepository get preferences => ServiceLocator.instance.find();
}
