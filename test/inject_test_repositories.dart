import 'package:cats/app/domain/repositories/breeds_repository.dart';
import 'package:cats/app/domain/repositories/connectivity_repository.dart';
import 'package:cats/app/domain/repositories/preferences_repository.dart';
import 'package:cats/app/presentation/global/service_locator/service_locator.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

void injectTestRepositories({
  bool defaultStubs = true,
}) {
  ServiceLocator.instance.clear();

  final preferencesRepository = MockPreferenceRepository();

  if (defaultStubs) {
    when(preferencesRepository.darkMode).thenReturn(false);
  }

  ServiceLocator.instance.put<PreferenceRepository>(
    preferencesRepository,
  );
  ServiceLocator.instance.put<ConnectivityRepository>(
    MockConnectivityRepository(),
  );
  ServiceLocator.instance.put<BreedsRepository>(
    MockBreedsRepository(),
  );
}
