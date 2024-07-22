import 'package:cats/app/data/http/http.dart';
import 'package:cats/app/inject_repositories.dart';
import 'package:cats/app/presentation/global/service_locator/service_locator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  setUp(ServiceLocator.instance.clear);
  test(
    'injectRepositories',
    () {
      final connectivity = MockConnectivity();
      final internetChecker = MockInternetChecker();

      when(connectivity.checkConnectivity()).thenAnswer(
        (_) => Future.value([ConnectivityResult.wifi]),
      );
      when(connectivity.onConnectivityChanged).thenAnswer(
        (_) => const Stream.empty(),
      );

      when(internetChecker.hasInternet()).thenAnswer(
        (_) => Future.value(true),
      );

      injectDependencies(
        systemDarkMode: false,
        http: Http(
          client: MockClient(),
          apiKey: '',
          baseUrl: '',
        ),
        preferences: MockSharedPreferences(),
        connectivity: connectivity,
        internetChecker: internetChecker,
      );

      Repositories.breeds;
      Repositories.connectivity;
      Repositories.preferences;
    },
  );
}
