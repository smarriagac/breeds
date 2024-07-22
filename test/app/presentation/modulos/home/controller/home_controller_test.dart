import 'package:cats/app/presentation/modules/home/controller/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../mocks.dart';

void main() {
  late HomeController controller;
  late MockBreedsRepository breedsRepository;
  setUpAll(() {
    breedsRepository = MockBreedsRepository();

    controller = HomeController(
      breedsRepository: breedsRepository,
    );
  });

  // test(
  //   'HomeController > load > fail',
  //   () async {
  //     when(breedsRepository.getBreeds()).thenAnswer(
  //       (_) => Future.value(
  //         Left(ResponseFailure.network()),
  //       ),
  //     );

  //     await controller.init();

  //     expect(
  //       controller.state,
  //       isA<HomeStateFailed>(),
  //     );
  //   },
  // );
}
