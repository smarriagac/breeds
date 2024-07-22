import 'package:cats/app/inject_repositories.dart';
import 'package:cats/app/presentation/global/controllers/theme_control.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../inject_test_repositories.dart';

void main() {
  late ThemeController themeController;

  setUp(
    () {
      injectTestRepositories();
      themeController = ThemeController(
        true,
        preferenceRepository: Repositories.preferences,
      );
    },
  );

  group('ThemeController > ', () {
    test(
      ' change theme ',
      () async {
        expect(
          themeController.darkMode,
          true,
        );
        themeController.onChange(false);
        expect(
          themeController.darkMode,
          false,
        );
      },
    );
  });
}
