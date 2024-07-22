import 'package:flutter_test/flutter_test.dart';

import '../../../../inject_test_repositories.dart';

void main() {
  setUp(injectTestRepositories);

  // testWidgets(
  //   'DetailsView',
  //   (tester) async {
  //     when(Repositories.preferences.darkMode).thenReturn(true);
  //     when(Repositories.connectivity.onInternetChanged).thenAnswer(
  //       (_) => Stream.value(true),
  //     );

  //     await tester.pumpWidget(
  //       Root(
  //         initialRoute: Routes.HOME,
  //         appRoutesA: {
  //           ...appRoutes,
  //           Routes.DETAILS: (_) => const Scaffold(
  //                 body: Center(
  //                   child: Text('details'),
  //                 ),
  //               ),
  //         },
  //       ),
  //     );
  //     expect(
  //       find.byType(DetailsView),
  //       findsOneWidget,
  //     );
  //     await tester.pumpAndSettle();
  //     expect(
  //       find.text('details'),
  //       findsOneWidget,
  //     );
  //   },
  // );
}
