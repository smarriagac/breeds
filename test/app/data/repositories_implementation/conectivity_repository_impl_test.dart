import 'dart:async';

import 'package:cats/app/data/repositories_impl/connectivity_repository_impl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  group(
    'ConnectivityRepositoryImpl > ',
    () {
      late ConnectivityRepositoryImpl repository;
      late MockConnectivity connectivity;
      late MockInternetChecker internetChecker;

      setUp(
        () {
          connectivity = MockConnectivity();
          internetChecker = MockInternetChecker();

          repository = ConnectivityRepositoryImpl(
            connectivity: connectivity,
            internetChecker: internetChecker,
          );
        },
      );

      test(
        'hasInternet > not initialized',
        () async {
          when(
            connectivity.checkConnectivity(),
          ).thenAnswer(
            (_) async => Future.value([ConnectivityResult.wifi]),
          );

          when(
            internetChecker.hasInternet(),
          ).thenAnswer(
            (_) async => true,
          );

          when(
            connectivity.onConnectivityChanged,
          ).thenAnswer(
            (_) => const Stream.empty(),
          );

          expect(
            () {
              repository.hasInternet;
            },
            throwsAssertionError,
          );

          await repository.initialize();

          expect(
            repository.hasInternet,
            true,
          );
        },
      );

      test(
        'onConnectivityChange',
        () async {
          when(connectivity.checkConnectivity()).thenAnswer(
            (_) async => Future.value([ConnectivityResult.none]),
          );
          when(connectivity.onConnectivityChanged).thenAnswer(
            (_) => Stream.value([
              ConnectivityResult.wifi,
              ConnectivityResult.none,
              ConnectivityResult.mobile
            ]),
          );
          when(internetChecker.hasInternet()).thenAnswer(
            (_) async => true,
          );
          await repository.initialize();
          expect(repository.hasInternet, false);

          // final future = expectLater(
          //   repository.onInternetChanged,
          //   emitsInOrder(
          //     [
          //       true,
          //       false,
          //       true,
          //     ],
          //   ),
          // );
          // await future;
          // expect(repository.hasInternet, true);
        },
      );
    },
  );
}
