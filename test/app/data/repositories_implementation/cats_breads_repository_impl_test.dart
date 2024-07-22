import 'dart:convert';

import 'package:cats/app/data/data_source/remote/breeds_api.dart';
import 'package:cats/app/data/http/http.dart';
import 'package:cats/app/data/repositories_impl/breeds_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  late MockClient client;
  late BreedsRepositoryImpl repository;

  group(
    'BreedsRepositoryImpl >',
    () {
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
        required String path,
        required int statusCode,
        required Map<String, dynamic> json,
      }) {
        when(
          client.get(
            Uri.parse(path),
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
        'getBreeds > sucess',
        () async {
          mockGet(
            path: '/v1/breeds',
            json: {
              'weight': {'imperial': '4 - 10', 'metric': '2 - 5'},
              'id': 'bali',
              'name': 'Balinese',
              'cfa_url': 'http://cfa.org/Breeds/BreedsAB/Balinese.aspx',
              'vetstreet_url': 'http://www.vetstreet.com/cats/balinese',
              'vcahospitals_url':
                  'https://vcahospitals.com/know-your-pet/cat-breeds/balinese',
              'temperament': 'Affectionate, Intelligent, Playful',
              'origin': 'United States',
              'country_codes': 'US',
              'country_code': 'US',
              'description':
                  'Balinese are curious, outgoing, intelligent cats with excellent communication skills. They are known for their chatty personalities and are always eager to tell you their views on life, love, and what you’ve served them for dinner. ',
              'life_span': '10 - 15',
              'indoor': 0,
              'alt_names': 'Long-haired Siamese',
              'adaptability': 5,
              'affection_level': 5,
              'child_friendly': 4,
              'dog_friendly': 5,
              'energy_level': 5,
              'grooming': 3,
              'health_issues': 3,
              'intelligence': 5,
              'shedding_level': 3,
              'social_needs': 5,
              'stranger_friendly': 5,
              'vocalisation': 5,
              'experimental': 0,
              'hairless': 0,
              'natural': 0,
              'rare': 0,
              'rex': 0,
              'suppressed_tail': 0,
              'short_legs': 0,
              'wikipedia_url': 'https://en.wikipedia.org/wiki/Balinese_(cat)',
              'hypoallergenic': 1,
              'reference_image_id': '13MkvUreZ'
            },
            statusCode: 200,
          );

          final breeds = await repository.getBreeds();
          expect(breeds, isNotNull);
        },
      );
      test(
        'getBreeds > errors',
        () async {
          mockGet(
            path: '',
            json: {
              'weight': {'imperial': '4 - 10', 'metric': '2 - 5'},
              'id': 'bali',
              'name': 'Balinese',
              'cfa_url': 'http://cfa.org/Breeds/BreedsAB/Balinese.aspx',
              'vetstreet_url': 'http://www.vetstreet.com/cats/balinese',
              'vcahospitals_url':
                  'https://vcahospitals.com/know-your-pet/cat-breeds/balinese',
              'temperament': 'Affectionate, Intelligent, Playful',
              'origin': 'United States',
              'country_codes': 'US',
              'country_code': 'US',
              'description':
                  'Balinese are curious, outgoing, intelligent cats with excellent communication skills. They are known for their chatty personalities and are always eager to tell you their views on life, love, and what you’ve served them for dinner. ',
              'life_span': '10 - 15',
              'indoor': 0,
            },
            statusCode: 400,
          );

          final breeds = await repository.getBreeds();

          final response = breeds.whenOrNull(
            left: (value) => value,
          );
          expect(response, isNull);
        },
      );
    },
  );
}
