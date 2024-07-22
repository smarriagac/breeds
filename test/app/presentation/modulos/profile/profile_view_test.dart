import 'package:cats/app/presentation/routes/app_routes.dart';
import 'package:cats/app/presentation/routes/routes.dart';
import 'package:cats/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../inject_test_repositories.dart';

void main() {
  setUp(injectTestRepositories);
  testWidgets(
    'ProfileView > darkMode',
    (tester) async {
      await initApp(tester);
      final scaffoldState = tester.state(
        find.byType(Scaffold),
      );
      final initialBrightness = Theme.of(scaffoldState.context).brightness;
      expect(initialBrightness, Brightness.light);
      await tester.tap(
        find.byType(SwitchListTile),
      );
      await tester.pumpAndSettle();
      expect(
        Theme.of(scaffoldState.context).brightness,
        Brightness.dark,
      );
    },
  );
}

Future<void> initApp(
  WidgetTester tester, {
  String? initialRoute,
}) {
  return tester.pumpWidget(
    Root(
      initialRoute: initialRoute ?? Routes.PROFILE,
      appRoutesA: {
        ...appRoutes,
        Routes.HOME: (context) => Scaffold(
              key: const Key('home'),
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      Routes.PROFILE,
                    ),
                    icon: const Icon(Icons.person),
                  ),
                ],
              ),
            )
      },
    ),
  );
}
