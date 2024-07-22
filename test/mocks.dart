import 'package:cats/app/data/data_source/remote/internet_checker.dart';
import 'package:cats/app/domain/repositories/breeds_repository.dart';
import 'package:cats/app/domain/repositories/connectivity_repository.dart';
import 'package:cats/app/domain/repositories/preferences_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks(
  [
    Client,
    Connectivity,
    InternetChecker,
    SharedPreferences,
    PreferenceRepository,
    ConnectivityRepository,
    BreedsRepository,
  ],
)
export 'mocks.mocks.dart';
