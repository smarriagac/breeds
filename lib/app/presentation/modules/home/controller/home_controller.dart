import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/repositories/breeds_repository.dart';
import '../../../../reposiories.dart';
import 'state/home_state.dart';

final homeController = StateNotifierProvider<HomeController, HomeState>(
  (ref) {
    final breedsRepository = ref.watch(Repositories.breeds);
    return HomeController(
      breedsRepository: breedsRepository,
    )..init();
  },
);

class HomeController extends StateNotifier<HomeState> {
  HomeController({
    required BreedsRepository breedsRepository,
  })  : _breedsRepository = breedsRepository,
        super(const HomeState.loading());

  final BreedsRepository _breedsRepository;

  Future init({
    int page = 0,
    int limit = 15,
  }) async {
    // log(status);
    // state = const HomeState.loading();
    final resultApi = await _breedsRepository.getBreeds(
      page: page,
      limit: limit,
    );
    state = resultApi.when(
      left: (_) => const HomeState.failed(),
      right: (list) {
        final listState = state.mapOrNull(
          loaded: (dataList) => dataList.state.listBreeds,
        );
        if (list.isEmpty) {
          return const HomeState.loading();
        }

        final result = HomePageState(
          listBreeds: [
            ...listState ?? [],
            ...list,
          ],
          page: page,
        );
        return HomeState.loaded(result);
      },
    );
    // log('$resultApi');
  }
}
