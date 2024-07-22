import 'package:cats/app/inject_repositories.dart';
import 'package:cats/app/presentation/modules/offline/view/offline_view.dart';
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
    'OfflineView',
    (tester) async {
      when(Repositories.preferences.darkMode).thenReturn(false);
      when(Repositories.connectivity.onInternetChanged).thenAnswer(
        (_) => Stream.value(true),
      );
      await tester.pumpWidget(
        Root(
          initialRoute: Routes.OFFLINE,
          appRoutesA: {
            ...appRoutes,
            Routes.SPLASH: (_) => const Scaffold(
                  body: Center(
                    child: Text('splash'),
                  ),
                ),
          },
        ),
      );
      expect(
        find.byType(OfflineView),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
      expect(
        find.text('splash'),
        findsOneWidget,
      );
    },
  );
}
