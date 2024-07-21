import 'dart:convert';

import 'package:cats/app/data/data_source/remote/breeds_api.dart';
import 'package:cats/app/data/http/http.dart';
import 'package:cats/app/data/repositories_impl/breeds_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  late MockClient client;
  late BreedsRepositoryImpl repository;

  setUp(
    () {
      client = MockClient();
      final breedsAPI = BreedsAPI(
        Http(
          baseUrl: 'https://api.thecatapi.com',
          apiKey:
              'ive_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr',
        ),
      );

      repository = BreedsRepositoryImpl(
        breedsAPI,
      );
    },
  );

  void mockGet({
    required int statusCode,
    required Map<String, dynamic> json,
  }) {
    when(
      client.get(
        any,
        headers: anyNamed('headers'),
      ),
    ).thenAnswer(
      (_) async => Response(
        jsonEncode(json),
        statusCode,
      ),
    );
  }

  test(
    'AccountRepositoryImpl > getUserData',
    () async {
      mockGet(
        json: {
          'id': 123,
          'username': 'sm',
          'avatar': {},
        },
        statusCode: 200,
      );

      final user = await repository.getBreeds();
      expect(user, isNotNull);
    },
  );
}
