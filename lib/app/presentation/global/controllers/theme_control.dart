import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/repositories/preferences_repository.dart';
import '../../../reposiories.dart';

final themeProvider = StateNotifierProvider<ThemeControl, bool>(
  (ref) {
    final preferenceRepository = ref.watch(Repositories.preferences);

    return ThemeControl(
      preferenceRepository.darkMode,
      preferenceRepository: preferenceRepository,
    );
  },
);

class ThemeControl extends StateNotifier<bool> {
  ThemeControl(
    super.state, {
    required PreferenceRepository preferenceRepository,
  }) : _preferenceRepository = preferenceRepository;

  final PreferenceRepository _preferenceRepository;

  void onChange(bool darkMode) {
    state = darkMode;
    _preferenceRepository.setDarkMode(darkMode);
  }
}
