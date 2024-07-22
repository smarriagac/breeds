import 'package:cats/app/domain/either/either.dart';
import 'package:cats/app/inject_repositories.dart';
import 'package:cats/app/presentation/modules/splash/view/splash_view.dart';
import 'package:cats/app/presentation/routes/app_routes.dart';
import 'package:cats/app/presentation/routes/routes.dart';
import 'package:cats/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../inject_test_repositories.dart';

void main() {
  setUp(injectTestRepositories);
  testWidgets(
    'SplashView > offline',
    (tester) async {
      when(Repositories.preferences.darkMode).thenReturn(false);
      when(Repositories.connectivity.hasInternet).thenReturn(false);

      await tester.pumpWidget(
        Root(
          appRoutesA: {
            ...appRoutes,
            Routes.OFFLINE: (_) => const Scaffold(
                  body: Center(
                    child: Text('offline'),
                  ),
                )
          },
        ),
      );

      expect(
        find.byType(SplashView),
        findsOneWidget,
      );

      await tester.pumpAndSettle();

      expect(
        find.text('offline'),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'SplashView > home',
    (tester) async {
      when(Repositories.preferences.darkMode).thenReturn(true);
      when(Repositories.connectivity.hasInternet).thenReturn(true);

      when(Repositories.breeds.getBreeds()).thenAnswer(
        (_) async => Right([]),
      );

      await tester.pumpWidget(
        Root(
          appRoutesA: {
            ...appRoutes,
            Routes.HOME: (_) => const Scaffold(
                  body: Center(
                    child: Text('home'),
                  ),
                )
          },
        ),
      );

      expect(
        find.byType(SplashView),
        findsOneWidget,
      );

      await tester.pumpAndSettle();

      expect(
        find.text('home'),
        findsOneWidget,
      );
    },
  );
}
