import '../../domain/either/either.dart';
import '../../domain/models/breeds/breeds.dart';
import '../../domain/models/failure/response_failure.dart';
import '../../domain/repositories/breeds_repository.dart';
import '../data_source/remote/breeds_api.dart';

class BreedsRepositoryImpl implements BreedsRepository {
  BreedsRepositoryImpl(this._breedsAPI);

  final BreedsAPI _breedsAPI;

  @override
  Future<Either<ResponseFailure, List<Breeds>>> getBreeds({
    int page = 0,
    int limit = 20,
  }) async {
    final result = await _breedsAPI.getBreeds(
      page: page,
      limit: limit,
    );
    return result.when(
      left: Either.left,
      right: Either.right,
    );
  }
}
