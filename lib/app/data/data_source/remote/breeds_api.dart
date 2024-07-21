import '../../../domain/either/either.dart';
import '../../../domain/models/breeds/breeds.dart';
import '../../../domain/models/failure/response_failure.dart';
import '../../http/http.dart';
import '../utils/handle_failure.dart';

class BreedsAPI {
  BreedsAPI(this._http);

  final Http _http;

  Future<Either<ResponseFailure, List<Breeds>>> getBreeds({
    int page = 0,
    int limit = 20,
  }) async {
    final result = await _http.request(
      '/v1/breeds',
      queryParameters: {
        'limit': '$limit',
        'page': '$page',
      },
      onSuccess: (response) => (response as List)
          .map(
            (e) => Breeds.fromJson(e),
          )
          .toList(),
    );

    return result.when(
      left: handleFailure,
      right: Either.right,
    );
  }
}
