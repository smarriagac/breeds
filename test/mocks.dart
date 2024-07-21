import 'package:cats/app/data/data_source/remote/internet_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    Client,
    Connectivity,
    InternetChecker,
  ],
)
export 'mocks.mocks.dart';
