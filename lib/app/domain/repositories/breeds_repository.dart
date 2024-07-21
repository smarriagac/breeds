import '../either/either.dart';
import '../models/breeds/breeds.dart';
import '../models/failure/response_failure.dart';

abstract class BreedsRepository {
  Future<Either<ResponseFailure, List<Breeds>>> getBreeds({
    int page = 0,
    int limit = 20,
  });
}
