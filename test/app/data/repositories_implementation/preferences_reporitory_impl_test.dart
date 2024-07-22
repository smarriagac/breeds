import 'package:cats/app/data/repositories_impl/preference_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  group(
    'PreferenceRepositoryImpl >',
    () {
      test(
        'get darkMode > true',
        () async {
          final preferences = MockSharedPreferences();
          when(
            preferences.getBool(Preference.darkMode.name),
          ).thenReturn(true);

          final repository = PreferenceRepositoryImpl(
            preferences: preferences,
            systemDarlMode: false,
          );
          expect(repository.darkMode, true);
        },
      );
      test(
        'get darkMode > false',
        () async {
          final preferences = MockSharedPreferences();
          when(
            preferences.getBool(Preference.darkMode.name),
          ).thenReturn(false);

          final repository = PreferenceRepositoryImpl(
            preferences: preferences,
            systemDarlMode: false,
          );
          expect(repository.darkMode, false);
        },
      );

      test(
        'setDarkMode',
        () async {
          final preferences = MockSharedPreferences();
          bool? darkMode;
          when(
            preferences.getBool(Preference.darkMode.name),
          ).thenAnswer(
            (_) => darkMode,
          );

          when(
            preferences.setBool(Preference.darkMode.name, any),
          ).thenAnswer(
            (invocation) async {
              darkMode = invocation.positionalArguments.last;
              return darkMode!;
            },
          );

          final repository = PreferenceRepositoryImpl(
            preferences: preferences,
            systemDarlMode: false,
          );

          expect(repository.darkMode, false);

          await repository.setDarkMode(true);

          expect(repository.darkMode, true);

          await repository.setDarkMode(false);
          expect(repository.darkMode, false);
        },
      );
    },
  );
}
